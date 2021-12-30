using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Product p = ProductUtility.GetProduct(id);

            TextBox1.Text = p.ProductID.ToString();
            TextBox2.Text = p.ProductName;
            DropDownList1.SelectedValue = p.ProductCategory;
            TextBox3.Text = p.Price.ToString();
            TextBox4.Text = p.Count.ToString();
            Label1.Text = p.Color;
            TextBox5.Text = p.Tags;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null)
        {
            StringBuilder color = new StringBuilder();

            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    color.Append(CheckBoxList1.Items[i].Value.Trim() + ",");
                }
            }
            color = color.Remove(color.Length - 1, 1);

            Product p = new Product(
                          int.Parse(TextBox1.Text),
                          TextBox2.Text,
                          DropDownList1.SelectedValue,
                          int.Parse(TextBox3.Text),
                          int.Parse(TextBox4.Text),
                          color.ToString(),
                          TextBox5.Text,
                          HiddenField1.Value,
                          FileUpload1.FileName.Replace(".jpg", "")
                          );
            ProductUtility.Update(p);
            string path = Server.MapPath($"/img/product/allProducts/{p.ImageFile}");
            //string path2 = Server.MapPath($"/Img/product/detail/{p.ImageFile}-")

            //String assetName = Path.GetFileNameWithoutExtension(input.Identity.SourceFilename);

            FileUpload1.SaveAs(path);
        }
        Response.Redirect("~/ProductList.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ProductList.aspx");
    }
}