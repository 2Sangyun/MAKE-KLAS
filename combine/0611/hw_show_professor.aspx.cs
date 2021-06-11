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

    public partial class hw_show_professor : System.Web.UI.Page
    {
        private MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=dmdthtlfdb!!"); /* 이 줄은 개인 환경에 맞춰서 작성 */
        private MySqlCommand cmd = new MySqlCommand();

        private string ID;
        private string course_id;
        private string hw_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            course_id = Request["course_id"];
            hw_id = Request["hw_id"];

            cmd.Connection = con;

            if (!Page.IsPostBack)
            {
                //그리드뷰 컨트롤에 데이터 출력
                DisplayData();
            }
            
        }
        private void DisplayData()
        {
            con.Open();

            cmd.CommandText = "select title from klas.course where course_id='" + course_id + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            lblCourse.Text = reader["title"].ToString();
            reader.Close();

            cmd.CommandText = "SELECT title, date_format(init_date, '%Y-%m-%d %H:%i:%s') as init_date, date_format(deadline, '%Y-%m-%d %H:%i:%s') as deadline, submit_form, file, content " +
                            "FROM klas.homework " +
                            "where course_id='" + course_id + "'" +
                            "and hw_id='" + hw_id + "'";
            reader = cmd.ExecuteReader();
            reader.Read();
            lblTitle.Text = reader["title"].ToString();
            lblDate.Text = reader["init_date"].ToString() + " ~ " + reader["deadline"].ToString();
            lblForm.Text = reader["submit_form"].ToString();
            downBtn.Text = reader["file"].ToString();
            contentBox.Text = reader["content"].ToString();
            reader.Close();

            DataTable dt = new DataTable();

            dt.Columns.Add("student_id", typeof(string));
            dt.Columns.Add("name", typeof(string));
            dt.Columns.Add("title", typeof(string));
            dt.Columns.Add("content", typeof(string));
            dt.Columns.Add("file", typeof(string));

            cmd.CommandText = "SELECT S.student_id, P.name, S.title, S.content, S.file " +
                            "FROM klas.submit_hw as S, klas.person as P " +
                            "where S.course_id='" + course_id + "' " +
                            "and S.hw_id='" + hw_id + "' " +
                            "and S.student_id = P.ID " +
                            "and S.state = '제출'";
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                DataRow dr = dt.NewRow();
                dr["student_id"] = reader["student_id"].ToString();
                dr["name"] = reader["name"].ToString();
                dr["title"] = reader["title"].ToString();
                dr["content"] = reader["content"].ToString();
                dr["file"] = reader["file"].ToString();

                dt.Rows.Add(dr);
            }

            con.Close();

            this.ctlBasicList.DataSource = dt;
            this.ctlBasicList.DataBind();
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("hw_list.aspx?current_id=" + ID));
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

        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?current_id=" + ID));
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebForm1.aspx?"));
        }

        protected void ctlBasicList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idx = Int32.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "cmd")
            {

                Button mybutton = null;
                mybutton = (Button)ctlBasicList.Rows[idx].Cells[4].Controls[0];
                string strFileName = mybutton.Text;

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
        }
    }
}