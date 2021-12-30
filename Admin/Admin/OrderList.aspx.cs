using GemBox.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       var orders = OrderListUtility.GetOrderListOrderByState();
        Repeater1.DataSource = orders;
        Repeater1.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
       
        SqlDataAdapter da = new SqlDataAdapter(
         "select top(10) OrderID,OrderDate,ShipName,Phone,Email,ShippedDate,State from OrderList",
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
        xlsx.Save(Response, "訂單資料.xlsx");
    }
    public string ChangeText(object o)
    {
        string str = o.ToString();
        string[] stateArray = { "收到訂單", "處理中", "已出貨", "完成訂單", "結案" };
        return stateArray[int.Parse(str)];
    }
}