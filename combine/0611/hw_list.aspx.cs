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
    public partial class hw_list : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=dmdthtlfdb!!"); /* 이 줄은 개인 환경에 맞춰서 작성 */
        MySqlCommand cmd = new MySqlCommand();

        //private string ID = "1234567890";
        private string ID;
        private string subject;
        private string position;

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];

            con.Open();
            cmd.Connection = con;

            cmd.CommandText = "select position from klas.person where ID='" + ID + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            position = reader["position"].ToString();
            reader.Close();

            if (position == "학부생")
            {
                cmd.CommandText = "select title " +
                                "from klas.course " +
                                "where course_id in (select course_id " +
                                                  "from klas.takes " +
                                                  "where ID='" + ID + "')";
                btnWrite.Enabled = false;
            }
            else
            {
                cmd.CommandText = "SELECT title " +
                                "FROM klas.course " +
                                "where course_id in (select course_id " +
                                                  "from klas.teaches " +
                                                  "where ID = '" + ID + "')";
            }
            reader = cmd.ExecuteReader();

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

            con.Open();
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
            con.Close();

            if (!Page.IsPostBack)
            {
                //그리드뷰 컨트롤에 데이터 출력
                DisplayData();
            }
        }
        private void DisplayData()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("hw_id", typeof(string));
            dt.Columns.Add("title", typeof(string));
            dt.Columns.Add("deadline", typeof(string));
            dt.Columns.Add("submit_state", typeof(string));

            con.Open();
            cmd.CommandText = "select course_id from klas.course where title='" + subject + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            string course_id = reader["course_id"].ToString();
            reader.Close();

            if (position == "학부생")
            {
                cmd.CommandText = "select H.hw_id, H.title, date_format(H.init_date, '%Y-%m-%d %H:%i:%s') as init_date, date_format(H.deadline, '%Y-%m-%d %H:%i:%s') as deadline, S.state " +
                                "from klas.homework as H, klas.submit_hw as S " +
                                "where H.course_id=S.course_id " +
                                "and H.course_id='" + course_id + "' " +
                                "and H.hw_id=S.hw_id " +
                                "and S.student_id='" + ID + "' " +
                                "order by H.hw_id desc";
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["hw_id"] = reader["hw_id"].ToString();
                    dr["title"] = reader["title"].ToString();
                    dr["deadline"] = reader["init_date"].ToString() + "\n~\n" + reader["deadline"].ToString();
                    dr["submit_state"] = reader["state"].ToString();

                    dt.Rows.Add(dr);
                }
            }
            else
            {
                cmd.CommandText = "SELECT hw_id, title, date_format(init_date, '%Y-%m-%d %H:%i:%s') as init_date, date_format(deadline, '%Y-%m-%d %H:%i:%s') as deadline " +
                                "FROM klas.homework " +
                                "where course_id='" + course_id + "' " +
                                "order by hw_id desc";
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["hw_id"] = reader["hw_id"].ToString();
                    dr["title"] = reader["title"].ToString();
                    dr["deadline"] = reader["init_date"].ToString() + "\n~\n" + reader["deadline"].ToString();
                    dr["submit_state"] = "";

                    dt.Rows.Add(dr);
                }
            }

            con.Close();

            this.ctlBasicList.DataSource = dt;
            this.ctlBasicList.DataBind();
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
            Response.Redirect(string.Format("hw_write.aspx?current_id=" + ID));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            subject = DropDownList1.SelectedItem.ToString();
            DisplayData();
        }
        protected void ctl_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idx = Int32.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "cmd")
            {
                subject = DropDownList1.SelectedItem.ToString();
                con.Open();
                cmd.CommandText = "select course_id from klas.course where title='" + subject + "'";
                MySqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                string course_id = reader["course_id"].ToString();
                con.Close();

                if (position == "학부생")
                {
                    if (ctlBasicList.Rows[idx].Cells[3].Text == "제출")
                    {
                        Response.Redirect(string.Format("hw_show_submit.aspx?current_id=" + ID +
                            "&course_id=" + course_id + "&hw_id=" + ctlBasicList.Rows[idx].Cells[0].Text));
                    }
                    else
                    {
                        Response.Redirect(string.Format("hw_show_not_submit.aspx?current_id=" + ID +
                            "&course_id=" + course_id + "&hw_id=" + ctlBasicList.Rows[idx].Cells[0].Text));
                    }
                }
                else
                {
                    Response.Redirect(string.Format("hw_show_professor.aspx?current_id=" + ID +
                        "&course_id=" + course_id + "&hw_id=" + ctlBasicList.Rows[idx].Cells[0].Text));
                }
            }
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