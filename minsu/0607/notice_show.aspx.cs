using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class notice_show : System.Web.UI.Page
    {
        private string ID;
        private MySqlConnection conn =
           new MySqlConnection("Server=localhost;Database=KLAS;Uid=root;Pwd=alstn2512!;");
        private MySqlCommand cmd = new MySqlCommand();

        private string course_id, notice_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            course_id = Request["course_id"];
            notice_id = Request["notice_id"];

            cmd.Connection = conn;

            if (!Page.IsPostBack)
            {
                // 넘겨져온 정보를 토대로 해당하는 글 출력하도록 해야함. (즉, 다른 웹폼에서 정보를 받아오는 방법을 알아봐야함)
                //
                Display();
            }
        }
        private void Display()
        {
            conn.Open();
            cmd.CommandText = "SELECT title, writer_id, date, hits, content " +
                "FROM klas.notice_list " +
                "where course_id = '" + course_id + "' " +
                "and notice_id = " + notice_id;
            MySqlDataReader reader = cmd.ExecuteReader();

            reader.Read();
            this.lblName.Text = reader["writer_id"].ToString();
            this.lblTitle.Text = reader["title"].ToString();
            this.lblPostDate.Text = reader["date"].ToString();
            this.contentBox.Text = reader["content"].ToString();
            this.lblReadCount.Text = reader["hits"].ToString();

            reader.Close();
            conn.Close();
        }
        protected void btnModifty_Click(object sender, EventArgs e)
        {
            conn.Open();
            cmd.CommandText = "UPDATE `klas`.`notice_list` " +
                "SET `content` = '" + contentBox.Text + "'" +
                "WHERE (`course_id` = '" + course_id + "') and (`notice_id` = '" + notice_id + "');";
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            conn.Open();
            cmd.CommandText = "DELETE FROM `klas`.`notice_list` " +
                "WHERE (`course_id` = '" + course_id + "') and (`notice_id` = '" + notice_id + "');";
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("./notice_list.aspx?current_id=" + ID);
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
    }
}