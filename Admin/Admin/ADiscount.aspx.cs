using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ADiscount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        var discount = DiscountUtility.GetDiscount();
        Repeater1.DataSource = discount;
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //var add = new Discount();
        var d = new Discount(0, TextBox1.Text, TextBox2.Text, int.Parse(TextBox3.Text), datepicker.Text, datepicker2.Text);
        DiscountUtility.Add(d);
        Response.Redirect("./ADiscount.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./ADiscount.aspx");
    }

   
}