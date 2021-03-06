using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetailForMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Member m = MemberUtility.GetMember(int.Parse(Request.QueryString["id"]));
        Label1.Text = m.UserName;
       var lists = OrderListUtility.GetOrderLists(int.Parse(Request.QueryString["id"]));
        Repeater1.DataSource = lists;
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MemberList.aspx");
    }
}