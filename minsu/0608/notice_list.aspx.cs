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
    public partial class notice_list : System.Web.UI.Page
    {
        /* 이 줄은 개인 환경에 맞춰서 작성 */
        private MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=alstn2512!");
        private MySqlCommand cmd = new MySqlCommand();

        private string ID;
        private string position;
        private string subject;

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            cmd.Connection = con;
            con.Open();

            cmd.CommandText = "select position from klas.person where ID='" + ID + "'";
            MySqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            position = reader["position"].ToString();
            reader.Close();

            if (position == "학부생")
            {
                cmd.CommandText = "SELECT title " +
                                "FROM klas.course " +
                                "where course_id in (select course_id " +
                                                  "from klas.takes " +
                                                  "where ID = '" + ID + "')";
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

            if (!Page.IsPostBack)
            {
                //그리드뷰 컨트롤에 데이터 출력
                DisplayData();
            }
        }
        private void DisplayData()
        {
            cmd.CommandText = "SELECT *, '" + ID + "' as ID " +
                            "FROM klas.notice_list " +
                            "where course_id in (select course_id " +
                                             "from klas.course " +
                                             "where title = '" + subject + "') " +
                            "order by notice_id desc";

            MySqlDataAdapter da = new MySqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);

            this.ctlBasicList.DataSource = ds.Tables[0];
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
            Response.Redirect(string.Format("notice_write.aspx?current_id=" + ID));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            subject = DropDownList1.SelectedItem.ToString();
            DisplayData();
        }
    }
}