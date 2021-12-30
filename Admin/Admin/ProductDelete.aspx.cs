using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Product p = ProductUtility.GetProducts(id);

            TextBox1.Text = p.ProductID.ToString();
            Image1.ImageUrl = "~/img/product/allProducts/" + $"{p.ImageFile}.jpg";
            //Label1.Text = p.ProductDetail;
            TextBox2.Text = p.ProductName;
            TextBox3.Text = p.ProductCategory;
            TextBox4.Text = p.Price.ToString();
            //TextBox5.Text = p.Count.ToString();
            TextBox6.Text = p.Color;
            TextBox7.Text = p.Tags;   
           
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(TextBox1.Text);
        ProductUtility.Delete(id);
        Response.Redirect("~/ProductList.aspx");
    }  
    protected void Button2_Click(object sender, EventArgs e) => Response.Redirect("~/ProductList.aspx");
}