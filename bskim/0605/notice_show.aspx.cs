using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginKlas
{
    public partial class notice_show : System.Web.UI.Page
    {
        private string ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                ID = Request["current_id"];
            {
                // 넘겨져온 정보를 토대로 해당하는 글 출력하도록 해야함. (즉, 다른 웹폼에서 정보를 받아오는 방법을 알아봐야함)

                Display();
            }
        }

        private void Display()
        {
            /*
             * (구현) -> notiec_list에서 아마 우리가 어떤 것을 클릭했다는 정보를 토대로 데이터를 읽어와야 하는데
             *           아직 우리가 그 부분은 추가를 못해서 아마도 DB에서 임의의 튜플을 하나 읽어와야 할듯?
             * dr은 DataReader선언한거고 아래처럼 텍스트를 써줄 생각인데, 다른 방법있으면 해도 상관 없음.
            this.lblName.Text = dr["name"].ToString();
            this.lblTitle.Text = dr["title"].ToString();
            this.lblPostDate.Text = dr["date"].ToString();
            this.lblContent.Text = dr["Content"].ToString();
            this.lblReadCount.Text = dr["hits"].ToString();
            */
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            /* (구현) 해당 튜플의 내용이 DB에 수정됨*/
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            /* (구현) 해당 튜플이 DB에서 삭제 */
        }
        protected void btnList_Click(object sender, EventArgs e)
        {
            //리스트 페이지로 이동 
            Response.Redirect("./notice_list.aspx?current_id=" + ID);

        }
        protected void mainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebMain.aspx?current_id=" + ID));
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("WebForm1.aspx?"));
        }    
    }
}