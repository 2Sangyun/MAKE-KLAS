using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            Response.Redirect(string.Format("WebMain.aspx?"));
            Response.Write(IdBox.Text);
            Response.Write(PwBox.Text);
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