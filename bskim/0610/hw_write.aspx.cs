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
        private MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=dmdthtlfdb!!");
        private MySqlCommand cmd = new MySqlCommand();

        private string ID;
        public string subject;

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            //Page.SetFocus("txtName");
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT title FROM klas.course";
            MySqlDataReader reader = cmd.ExecuteReader();

            int i = 0;
            while (reader.Read())
            {
                DropDownList1.Items[i].Text = reader["title"].ToString();
                i++;
            }

            //subject = DropDownList1.Items[0].ToString();

            con.Close();
            con.Open();
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
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
            int notice_id = 0;

            subject = DropDownList1.SelectedItem.ToString();

            con.Open();
            cmd.CommandText = "SELECT course_id FROM klas.course where title='" + subject + "'";
            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            course_id = rd["course_id"].ToString();
            rd.Close();

            cmd.CommandText = "SELECT notice_id " +
                            "FROM klas.notice_list " +
                            "where course_id='" + course_id + "' " +
                            "order by notice_id desc";
            rd = cmd.ExecuteReader();
            rd.Read();
            if (rd.HasRows)
            {
                notice_id = Int32.Parse(rd["notice_id"].ToString());
                notice_id++;
            }
            rd.Close();

            
            cmd.CommandText = "INSERT INTO `klas`.`notice_list` " +
                            "(`course_id`, `notice_id`, `notice_type`, `title`, `date`, `writer_id`, `importance`, `content`, `hits`) " +
                            "VALUES ('" + course_id + "', " +
                                   "'" + notice_id.ToString() + "', " +
                                   "'강의 공지사항', " +
                                   "'" + txtTitle.Text + "', " +
                                   "'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', " +
                                   "'" + ID + "', " +
                                   "'0', " +
                                   "'" + txtContent.Text + "', " +
                                   "'0');";
            cmd.ExecuteNonQuery();

            con.Close();

            if (FileUpload1.HasFile)
            {
                con.Open();
                /*작성*/
                cmd.CommandText = "";//"UPDATE `klas`.`notice_list` SET `file` ='" + FileUpload1.FileName + "' WHERE (`course_id` = '" + course_id + "') and (`notice_id` = '" + notice_id.ToString() + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                FileUpload1.SaveAs("C:\\uploads\\" + FileUpload1.FileName);

            }

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
        protected void goNoticeList(object sender, EventArgs e)
        {
            Response.Redirect("notice_list.aspx?current_id=" + ID);
        }

        protected void goMaterialList(object sender, EventArgs e)
        {
            Response.Redirect("material_list.aspx?current_id=" + ID);
        }
        protected void goHWList(object sender, EventArgs e)
        {
            Response.Redirect("hw_list.aspx?current_id=" + ID);
        }
    }
}
