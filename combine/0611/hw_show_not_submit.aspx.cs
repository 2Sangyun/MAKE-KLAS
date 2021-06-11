using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class hw_show_not_submit : System.Web.UI.Page
    {
        private string ID;
        private MySqlConnection conn =
           new MySqlConnection("Server=localhost;Database=KLAS;Uid=root;Pwd=dmdthtlfdb!!;");
        private MySqlCommand cmd = new MySqlCommand();

        private string course_id, hw_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            course_id = Request["course_id"];
            hw_id = Request["hw_id"];

            cmd.Connection = conn;
            conn.Open();
            
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
            conn.Close();

            if (!Page.IsPostBack)
            {
                Display();
            }
        }
        private void Display()
        {
            conn.Open();

            cmd.CommandText = "select title from klas.course where course_id='" + course_id + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            this.lblCourse.Text = reader["title"].ToString();
            reader.Close();

            cmd.CommandText = "select title, date_format(init_date, '%Y-%m-%d %H:%i:%s') as init_date, date_format(deadline, '%Y-%m-%d %H:%i:%s') as deadline, submit_form, file, content " +
                            "from klas.homework " +
                            "where course_id='" + course_id + "' and hw_id='" + hw_id + "'";
            reader = cmd.ExecuteReader();
            reader.Read();
            this.lblTitle.Text = reader["title"].ToString();
            this.lblDate.Text = reader["init_date"].ToString() + " ~ " + reader["deadline"].ToString();
            this.contentBox.Text = reader["content"].ToString();
            this.downBtn.Text = reader["file"].ToString();
            this.lblForm.Text = reader["submit_form"].ToString();
            reader.Close();

            cmd.CommandText = "SELECT state " +
                            "FROM klas.submit_hw " +
                            "where student_id='" + ID + "' " +
                            "and course_id='" + course_id + "' " +
                            "and hw_id='" + hw_id + "'";
            reader = cmd.ExecuteReader();
            reader.Read();
            this.lblState.Text = reader["state"].ToString();

            conn.Close();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            /* 제출버튼 누르면 submit_hw테이블에 insert 돼야함 */
            conn.Open();
            cmd.CommandText = "UPDATE `klas`.`submit_hw` " +
                            "SET `title` = '" + txtTitle.Text + "', " +
                                "`state` = '제출', " +
                                "`content` = '" + txtContent.Text + "' " +
                            "WHERE (`course_id` = '" + course_id + "') " +
                            "and (`hw_id` = '" + hw_id + "') " +
                            "and (`student_id` = '" + ID + "');";
            cmd.ExecuteNonQuery();

            /*파일 업로드 기능*/
            if (FileUpload1.HasFile)
            {
                cmd.CommandText = "UPDATE `klas`.`submit_hw` " +
                                "SET `file` = '" + FileUpload1.FileName + "' " +
                                "WHERE (`course_id` = '" + course_id + "') " +
                                "and (`hw_id` = '" + hw_id + "') " +
                                "and (`student_id` = '" + ID + "');";
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs("C:\\uploads\\" + FileUpload1.FileName);
            }

            conn.Close();

            Response.Redirect("hw_list.aspx?current_id=" + ID);
        }
       
        protected void btnList_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("./hw_list.aspx?current_id=" + ID);

        }
        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?current_id=" + ID));
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebForm1.aspx?"));
        }

        protected void downBtn_Click(object sender, EventArgs e)
        {
            string strFileName = downBtn.Text;
            if (strFileName == "")
                return;
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition",
              "attachment;filename=" +
              Server.UrlPathEncode(strFileName));

            //Response.WriteFile("C:\\uploads\\test.txt");
            Response.WriteFile("C:\\uploads\\" + strFileName);
            Response.End();

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