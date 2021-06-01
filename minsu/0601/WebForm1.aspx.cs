using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace LoginKlas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                IdBox.Text = "put in!";
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string myConnection = "datasource = localhost; port=3306; username = root; password=alstn2512!";
            MySqlConnection myConn = new MySqlConnection(myConnection);

            MySqlCommand cmd = new MySqlCommand("select password from klas.password where ID=" + IdBox.Text, myConn);

            myConn.Open();

            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            if(rd["password"].ToString().Equals(PwBox.Text))
                Response.Redirect(string.Format("WebMain.aspx?ID=" + IdBox.Text));
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