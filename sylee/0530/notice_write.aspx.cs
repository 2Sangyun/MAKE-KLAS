using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class notice_write : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.SetFocus("txtName");
        }

        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?"));
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


            Response.Redirect("notice_list.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("notice_list.aspx");
        }


    }
}