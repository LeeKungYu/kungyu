using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class MemberAddress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Member m = MemberUtility.GetMember(id);

            TextBox1.Text = m.MemberID.ToString();
            TextBox2.Text = m.UserName;
            TextBox3.Text = m.Address;
    

            List<MemberShipping> shipping = MemberShippingUtility.GetMemberShipping(id);
            Repeater1.DataSource = shipping;
            Repeater1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MemberList.aspx");
    }
}