using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class hw_show_submit : System.Web.UI.Page
    {
        private string ID;
        private MySqlConnection conn =
           new MySqlConnection("Server=localhost;Database=KLAS;Uid=root;Pwd=dmdthtlfdb!!;");
        private MySqlCommand cmd = new MySqlCommand();

        private string course_id, notice_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlDataReader reader = cmd.ExecuteReader();
            ID = Request["current_id"];
            course_id = Request["course_id"];
            notice_id = Request["notice_id"];

            cmd.Connection = conn;


            if (!Page.IsPostBack)
            {
                Display();
            }
            conn.Open();
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
            conn.Close();
        }
        private void Display()
        {
            conn.Open();
            /* 수정해야함! homework테이블에서 읽어와야할듯?*/
            
            cmd.CommandText = "SELECT title, writer_id, date, hits, content, file " +
                "FROM klas.notice_list " +
                "where course_id = '" + course_id + "' " +
                "and notice_id = " + notice_id;
            MySqlDataReader reader = cmd.ExecuteReader();

            reader.Read();

            /*수정해야함!*/
            this.lblCourse.Text = reader["writer_id"].ToString();
            this.lblTitle.Text = reader["title"].ToString();
            this.lblDate.Text = reader["date"].ToString();
            this.contentBox.Text = reader["content"].ToString();
            this.lblState.Text = reader["hits"].ToString();
            this.downBtn.Text = reader["file"].ToString();

            reader.Close();
            conn.Close();

            /* submit_hw 테이블에서 읽어야 할듯 */
            this.submitTitle.Text = reader["title"].ToString();
            this.submitcontentBox.Text = reader["content"].ToString();
            this.submitdownBtn.Text = reader["file"].ToString();

        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("./notice_list.aspx?current_id=" + ID);

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

        protected void submitdownBtn_Click(object sender, EventArgs e)
        {
            string strFileName = submitdownBtn.Text;
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