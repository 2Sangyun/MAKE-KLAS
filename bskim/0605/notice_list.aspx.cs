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
        private string ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request["current_id"];
            if (!Page.IsPostBack)
            {
                //그리드뷰 컨트롤에 데이터 출력
                DisplayData();
            }
        }
        private void DisplayData()
        {

            MySqlConnection con = new MySqlConnection("datasource = localhost; port=3306; username = root; password=dmdthtlfdb!!"); /* 이 줄은 개인 환경에 맞춰서 작성 */
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM klas.notice_list", con);

            MySqlDataAdapter da = new MySqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);

            //this.ctlBasicList.DataSource = ds.Tables[0];
            //this.ctlBasicList.DataBind();
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
    }
}