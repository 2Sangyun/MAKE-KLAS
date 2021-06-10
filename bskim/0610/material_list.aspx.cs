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
    public partial class material_list : System.Web.UI.Page
    {
        /* 이 줄은 개인 환경에 맞춰서 작성 */
        private MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=dmdthtlfdb!!");
        private MySqlCommand cmd = new MySqlCommand();

        private string ID;
        private string subject;

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "SELECT title FROM klas.course";
            MySqlDataReader reader = cmd.ExecuteReader();

            int i = 0;
            while (reader.Read())
            {
                DropDownList1.Items[i].Text = reader["title"].ToString();
                i++;
            }

            subject = DropDownList1.Items[0].ToString();

            con.Close();

            if (!Page.IsPostBack)
            {
                //그리드뷰 컨트롤에 데이터 출력
                DisplayData();
            }
            con.Open();
            cmd.CommandText = "SELECT ID, name FROM klas.person where ID=" + ID + ";";
            reader = cmd.ExecuteReader();
            reader.Read();
            student_informationBtn.Text = reader["name"].ToString() + "(" + reader["ID"].ToString() + ")";
            con.Close();

        }
        private void DisplayData()
        {
            cmd.CommandText = "SELECT * " +
                            "FROM klas.notice_list " +
                            "where notice_type = '강의 자료실' and course_id in (select course_id " +
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
            Response.Redirect(string.Format("material_write.aspx?current_id=" + ID));
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            subject = DropDownList1.SelectedItem.ToString();
            DisplayData();
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