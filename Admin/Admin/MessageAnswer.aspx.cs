using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessageAnswer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(Request.QueryString["id"]);
        var m = MessageUtility.AAGetMessages(id);

        TextBox1.Text = m.ID.ToString();
        TextBox2.Text = m.Member.UserName;
        TextBox3.Text = m.Title;
        TextBox4.Text = m.QDate;
        TextBox5.Text = m.Message;
        if (m.File == null)
        {
            Label1.Text = "無上傳圖片";
        }
        else
        {
            Image1.ImageUrl = $"~/img/MessageBox/{m.File}";
        }
        Label2.Text = m.Answer;



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(TextBox1.Text);
        string m = HiddenField1.Value;
        string d = DateTime.Now.ToString("yyyy/MM/dd");
        MessageBox messageBox = MessageUtility.GetMessages().SingleOrDefault(r => r.ID == id);
        messageBox.Answer = m;
        messageBox.ADate = d;
        MessageUtility.UpDate(messageBox);
        //    var m = MessageUtility.AAGetMessages(id);
        //    var box = new MessageBox(int.Parse(TextBox1.Text),int.Parse(TextBox2.Text),TextBox3.Text,TextBox4.Text,TextBox5.Text,m.File, HiddenField1.Value, DateTime.Now.ToString("yyyy/MM/dd"));
        //    MessageUtility.UpDate(box);
        Response.Redirect("./MessageBox.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("./MessageBox.aspx");
    }


}