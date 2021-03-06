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
    public partial class notice_write : System.Web.UI.Page
    {
        private string ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            //Page.SetFocus("txtName");
            MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=khs30618"); /* 이 줄은 개인 환경에 맞춰서 작성 */
            con.Open();
            MySqlCommand cmd = new MySqlCommand("SELECT title FROM klas.course", con);
            MySqlDataReader reader = cmd.ExecuteReader();

            DropDownList1.DataSource = reader;

            DropDownList1.DataTextField = "title";
            DropDownList1.DataBind();
            con.Close();
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
            /* 
             
                (구현) 이 버튼을 클릭하면 데이터베이스에 해당 정보를 갖는 튜플이 하나 추가되는것

             */
            Response.Redirect("notice_list.aspx?current_id=" + ID);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("notice_list.aspx");
        }


    }
}