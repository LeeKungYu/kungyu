using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessageBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var messages= MessageUtility.GetMessageMemberName();
        var getName = messages.Select(x => new { x.ID, x.Member.UserName, x.Title, x.QDate, x.ADate });
        Repeater1.DataSource = getName;
        Repeater1.DataBind();
    }



    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //    MessageUtility.Delete(int.Parse(HiddenField1.Value));
    //    Response.Redirect("./MessageBox.aspx");


    //}
}