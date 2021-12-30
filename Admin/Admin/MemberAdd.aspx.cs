using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class MemberList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime joindate = DateTime.Now;
        DateTime birth = DateTime.ParseExact(datepicker2.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
        //DateTime joindate = DateTime.ParseExact(TextBox6.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
        //joindate.ToString("yyyy-MM-dd");
        //String.Format("{0:YYYY-MM-DD}", joindate);
        //birth.ToString("yyyy-MM-dd");
        //String.Format("{0:YYYY-MM-DD}", birth);

        Member m = new Member(0, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, joindate, Convert.ToInt32(DropDownList2.SelectedValue), DropDownList1.SelectedValue.ToString(), birth, TextBox8.Text);
        MemberUtility.Add(m);
        Response.Redirect("./MemberList.aspx");




    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MemberList.aspx");
    }
    //public string ChangeText(object o)
    //{
    //    string str = o.ToString();
    //    string[] stateArray = { "收到訂單", "處理中", "已出貨", "完成訂單", "結案" };
    //    return stateArray[int.Parse(str)];
    //}

   
}