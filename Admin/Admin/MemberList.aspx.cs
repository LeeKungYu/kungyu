using GemBox.Spreadsheet;
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


public partial class MemberList : System.Web.UI.Page
{
  

    protected void Page_Load(object sender, EventArgs e)
    {
        List<Member> members = MemberUtility.GetMembers();
        Repeater1.DataSource = members;
        Repeater1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MemberAdd.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //.\sqlexpress;Initial Catalog=Northwind;Integrated Security=true
        SqlDataAdapter da = new SqlDataAdapter(
          "select top(20) MemberID,UserName,Email,Gender,Phone,Address,BirthDate,JoinDate,EDM,Remark  from Members",
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
        xlsx.Save(Response, "會員資料.xlsx");
    }
    public string ChangeText(object o)
    {
        string str = o.ToString();
        string[] stateArray = { "男", "男", "女" };
        return stateArray[int.Parse(str)];
    }
}