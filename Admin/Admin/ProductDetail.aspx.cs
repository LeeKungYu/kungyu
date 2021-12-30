using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = int.Parse(Request.QueryString["id"]);
            HiddenField1.Value = id.ToString();
            Product products = ProductUtility.GetProducts(id);
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("~/ProductList.aspx");
            }
            else
            {

                //detal.Text = products.ProductDetail;
                Image1.ImageUrl = $"~/img/product/detail/{products.ImageFile.Replace(".jpg", "")}-1.jpg";
                Image2.ImageUrl = $"~/img/product/detail/{products.ImageFile.Replace(".jpg", "")}-2.jpg";
                Image3.ImageUrl = $"~/img/product/detail/{products.ImageFile.Replace(".jpg", "")}-3.jpg";
                //Image4.ImageUrl = $"~/img/product/detail/{products.ImageFile}-1.jpg";


                Label1.Text = products.ProductDetail;
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ProductList.aspx");
    }
}