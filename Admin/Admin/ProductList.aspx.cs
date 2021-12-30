using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Product> products = ProductUtility.GetProducts();
        Repeater1.DataSource = products;
        Repeater1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./ProductAdd.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {

        SqlDataAdapter da = new SqlDataAdapter(
         "select top(50) ProductID,ProductName,ProductCategory,Price,Count,Color,Tags from Products",
         @"Data Source=.\sqlexpress;initial catalog=MeowwwoDB;integrated security=True;multipleactiveresultsets=True;application name=EntityFramework&quot;"
         );
        DataTable dt = new DataTable("MyTable");
        da.Fill(dt);




        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY");
        ExcelFile xlsx = new ExcelFile();
        ExcelWorksheet mySheet = xlsx.Worksheets.Add("sheet1");
        mySheet.InsertDataTable(dt,
           new InsertDataTableOptions()
           {
               StartColumn = 0,
               StartRow = 0,
               ColumnHeaders = true
           });
        xlsx.Save(Response, "商品資料.xlsx");
    }
    public string ChangeText(object o)
    {
        string str = o.ToString();
        string[] stateArray = { "請選擇", "喵嗚的床", "紓壓小物", "外出用品" };
        return stateArray[int.Parse(str)];
    }
}