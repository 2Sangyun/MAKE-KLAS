using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!Page.IsPostBack)
                    IdBox.Text = "put in!";
        }


        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            //Response.Redirect(string.Format("login2.aspx?"));
            string myConnection = "datasource = localhost; port=3306; username = root; password=khs30618";
            MySqlConnection myConn = new MySqlConnection(myConnection);

            MySqlCommand cmd = new MySqlCommand("select * from klas.user ", myConn);

            myConn.Open();

            MySqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                string str = String.Format("{0}, {1}, {2}", rd["U_ID"], rd["ID"], rd["PW"]);
                if(IdBox.Text == rd["ID"].ToString() && PwBox.Text == rd["PW"].ToString())
                {
                    Response.Redirect(string.Format("login2.aspx?"));
                    break;
                }
            }

            
            // Response.Write(PwBox.Text);
            rd.Close();
            myConn.Close();
        }

        protected void FindPwBtn_Click(object sender, EventArgs e)
        {
            PnlPasswd.Visible = true;
        }

        protected void BtnExit1_Click(object sender, EventArgs e)
        {
            PnlPasswd.Visible = false;
        }

        protected void PersonalNumBtn_Click(object sender, EventArgs e)
        {
            PnlFindNumber.Visible = true;
        }

        protected void BtnExit2_Click(object sender, EventArgs e)
        {
            PnlFindNumber.Visible = false;
        }

        protected void RegisterPwBtn_Click(object sender, EventArgs e)
        {
            PnlRegisterPw.Visible = true;
        }

        protected void BtnExit3_Click(object sender, EventArgs e)
        {
            PnlRegisterPw.Visible = false;
        }
    }
}