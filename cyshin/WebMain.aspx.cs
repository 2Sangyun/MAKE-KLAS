using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginKlas
{
    public partial class WebMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tablesch.Rows[2].Cells[2].Text = "abcd";
        }

        protected void Time_Load()
        {
            
        }

        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?"));
        }
    }
}