using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class hw_write : System.Web.UI.Page
    {
        /* 이 줄은 개인 환경에 맞춰서 작성 */
        private MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=alstn2512!");
        private MySqlCommand cmd = new MySqlCommand();

        private string ID = "1234567890";
        private string subject;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ID = Request["current_id"];

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT title " +
                            "FROM klas.course " +
                            "where course_id in (select course_id " +
                                              "from klas.teaches " +
                                              "where ID = '" + ID + "')";
            MySqlDataReader reader = cmd.ExecuteReader();

            int i = 0;
            while (reader.Read())
            {
                DropDownList1.Items[i].Text = reader["title"].ToString();
                i++;
            }

            while (i < 8)
            {
                DropDownList1.Items[i].Enabled = false;
                i++;
            }

            subject = DropDownList1.Items[0].ToString();

            con.Close();
            if (!Page.IsPostBack)
            {
                DisplayYear();
                DisplayMonth();
                DisplayDay(31);
            }
        }

        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?current_id=" + ID));
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebForm1.aspx?"));
        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {

            /*쿼리 수정 해야함!*/
            /*this.start_year.SelectedValue 를 이용해서 DB에서 Datetime 타입에 맞춰야할듯?*/
            
            string course_id;
            int hw_id = 0;

            subject = DropDownList1.SelectedItem.ToString();

            con.Open();
            cmd.CommandText = "SELECT course_id FROM klas.course where title='" + subject + "'";
            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            course_id = rd["course_id"].ToString();
            rd.Close();

            cmd.CommandText = "SELECT hw_id " +
                            "FROM klas.homework " +
                            "where course_id='" + course_id + "' " +
                            "order by hw_id desc";
            rd = cmd.ExecuteReader();
            rd.Read();
            if (rd.HasRows)
            {
                hw_id = Int32.Parse(rd["hw_id"].ToString());
                hw_id++;
            }
            rd.Close();

            string init_date = start_year.SelectedValue + "-" + start_month.SelectedValue + "-" + start_day.SelectedValue + " 00:00:00";
            string deadline = finish_year.SelectedValue + "-" + finish_month.SelectedValue + "-" + finish_day.SelectedValue + " 23:59:59";

            cmd.CommandText = "INSERT INTO `klas`.`homework` (`course_id`, " +
                                                       "`hw_id`, " +
                                                       "`title`, " +
                                                       "`init_date`, " +
                                                       "`deadline`, " +
                                                       "`content`, " +
                                                       "`submit_form`) " +
                            "VALUES ('" + course_id + "', " +
                                   "'" + hw_id + "', " +
                                   "'" + txtTitle.Text + "', " +
                                   "'" + init_date + "', " +
                                   "'" + deadline + "', " +
                                   "'" + txtContent.Text + "', " +
                                   "'" + txtForm.Text + "');";
            cmd.ExecuteNonQuery();

            if (FileUpload1.HasFile)
            {
                cmd.CommandText = "UPDATE `klas`.`homework` " +
                                "SET `file` = '" + FileUpload1.FileName + "' " +
                                "WHERE (`course_id` = '" + course_id + "') " +
                                "and (`hw_id` = '" + hw_id + "');";
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs("C:\\uploads\\" + FileUpload1.FileName);

            }

            List<string> students = new List<string>();
            cmd.CommandText = "SELECT ID FROM klas.takes where course_id='" + course_id + "'";
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                students.Add(rd["ID"].ToString());
            }
            rd.Close();

            for(int i = 0; i < students.Count; ++i)
            {
                cmd.CommandText = "INSERT INTO `klas`.`submit_hw` (`student_id`, " +
                                                            "`course_id`, " +
                                                            "`hw_id`, " +
                                                            "`state`) " +
                                "VALUES ('" + students[i] + "', " +
                                       "'" + course_id + "', " +
                                       "'" + hw_id + "', " +
                                       "'미제출');";
                cmd.ExecuteNonQuery();
            }

            con.Close();

            Response.Redirect("hw_list.aspx?current_id=" + ID);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("hw_list.aspx?current_id=" + ID);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            subject = DropDownList1.SelectedItem.ToString();
        }

        /* ------------날짜 dropdownlist------------- */
        private void DisplayDay(int maxDay)
        {
            this.start_day.Items.Clear();
            this.finish_day.Items.Clear();
            for (int i = 1; i <= maxDay; i++)
            {
                this.start_day.Items.Add(new ListItem(i.ToString()));
                this.finish_day.Items.Add(new ListItem(i.ToString()));
            }
        }

        private void DisplayMonth()
        {
            for (int i = 1; i <= 12; i++)
            {
                this.start_month.Items.Add(new ListItem(i.ToString(), i.ToString()));
                this.finish_month.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        private void DisplayYear()
        {
            for (int i = DateTime.Now.Year + 1; i > DateTime.Now.Year - 1; i--)
            {
                this.start_year.Items.Add(new ListItem(i.ToString()));
                this.finish_year.Items.Add(new ListItem(i.ToString()));
            }
        }

        protected void lstYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDaysInMonth();
        }

        private void GetDaysInMonth()
        {
            int start_day = DateTime.DaysInMonth(Convert.ToInt32(start_year.SelectedValue), Convert.ToInt32(start_month.SelectedValue));
            DisplayDay(start_day);
            int finish_day = DateTime.DaysInMonth(Convert.ToInt32(finish_year.SelectedValue), Convert.ToInt32(finish_month.SelectedValue));
            DisplayDay(finish_day);
        }

        protected void lstMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDaysInMonth();
        }
    }
}
