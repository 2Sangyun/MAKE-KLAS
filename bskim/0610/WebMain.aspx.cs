using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace LoginKlas
{
    public partial class WebMain : System.Web.UI.Page
    {
        private MySqlConnection conn =
            new MySqlConnection("Server=localhost;Database=KLAS;Uid=root;Pwd=dmdthtlfdb!!;");
        private MySqlCommand cmd = new MySqlCommand();

        //private string ID = "2017203020";
        private string ID;// = "2019203039";
        private string position;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            // 시간표
            string[] colors = {"#ffcc00","#ecc369","#99abef","#ed99ef","#cc9aef"
                    ,"#7acf96","#7dd1c1","#efb399","#f45151"};
            int color_idx = 0;

            cmd.Connection = conn;
            conn.Open();

            cmd.CommandText = "select position from klas.person where ID='" + ID + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            position = reader["position"].ToString();
            reader.Close();

            if (position == "학부생")
            {
                cmd.CommandText = "SELECT title, time_slot_1, time_slot_2, time_slot_3 " +
                                "FROM klas.course natural join klas.section " +
                                "where course_id in (SELECT course_id " +
                                                  "FROM klas.takes " +
                                                  "where ID = '" + ID + "'); ";
            }
            else
            {
                cmd.CommandText = "SELECT title, time_slot_1, time_slot_2, time_slot_3 " +
                                "FROM klas.course natural join klas.section " +
                                "where course_id in (SELECT course_id " +
                                                  "FROM klas.teaches " +
                                                  "where ID = '" + ID + "'); ";
            }
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                for (int i = 1; i <= 3; ++i)
                {
                    string attribute = "time_slot_" + i.ToString();
                    string time_slot = reader[attribute].ToString();
                    if (time_slot.Length > 0)
                    {
                        int day = day_num(time_slot.Substring(0, 1));
                        int time = Convert.ToInt32(time_slot.Substring(1));

                        if (time < 7)
                        {
                            tablesch.Rows[time + 1].Cells[day].Text = reader["title"].ToString();
                            tablesch.Rows[time + 1].Cells[day].BackColor = System.Drawing.ColorTranslator.FromHtml(colors[color_idx]);
                        }
                        else if (time == 99)
                        {
                            tablesch.Rows[7].Cells[day].Text = reader["title"].ToString();
                        }
                    }
                }
                color_idx++;
            }

            conn.Close();

            // 학생 이름
            conn.Open();
            //cmd.CommandText = "SELECT ID, name FROM klas.person where ID=2019203039;";
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
            conn.Close();
        }

        private int day_num(string day)
        {
            switch (day)
            {
                case "월":
                    return 1;
                case "화":
                    return 2;
                case "수":
                    return 3;
                case "목":
                    return 4;
                case "금":
                    return 5;
                case "토":
                    return 6;
                default:
                    return 0;
            }
        }

        protected void Time_Load()
        {
            
        }

        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?current_id=" + ID));
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebForm1.aspx?"));
        }

        protected void s2_button_1_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("notice_list.aspx?current_id=" + ID));
        }

        protected void s2_button_2_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("material_list.aspx?current_id=" + ID));
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