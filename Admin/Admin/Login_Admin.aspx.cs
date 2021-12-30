using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Admin a = AdminUtility.GetAdmin(TextBox1.Text, TextBox2.Text);
        if (a == null)
        {
            Label1.Text = "*帳號密碼不正確，請重新輸入";
        }
        else
        {
            Session["UserInfo"] = a;
            Response.Redirect("~/MemberList.aspx");
        }
    }
}