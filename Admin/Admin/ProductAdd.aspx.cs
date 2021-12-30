using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class ProductAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        if (FileUpload1.HasFile)
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
                0,
                TextBox1.Text,
                DropDownList1.SelectedValue,
                int.Parse(TextBox2.Text),
                int.Parse(TextBox3.Text),
                color.ToString(),
                TextBox4.Text,
               HiddenField1.Value,
                FileUpload1.FileName.Replace(".jpg", "")
                );
            ProductUtility.Add(p);
            string path = Server.MapPath($"/img/product/allProducts/{p.ImageFile}");
            //string path2 = Server.MapPath($"/Img/product/detail/{p.ImageFile}-")

            FileUpload1.SaveAs(path);

        }

        Response.Redirect("./ProductList.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./ProductList.aspx");
    }



}
