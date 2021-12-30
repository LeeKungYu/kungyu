using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //取訂單編號、下單日、出貨日、優惠券名稱、折扣金額、收件人姓名、電話、地址、電子信箱
        var orderInfo = OrderListUtility.GetOrderList(int.Parse(Request.QueryString["id"]));
        Label5.Text = $"9048000{orderInfo.OrderID}";
        Label6.Text = orderInfo.OrderDate;
        Label7.Text = orderInfo.ShippedDate;
        Label10.Text = orderInfo.DiscountName;
        Label12.Text = $"(-) ${orderInfo.DiscountPrice}";
        Label1.Text = orderInfo.ShipName;
        Label2.Text = orderInfo.Phone;
        Label3.Text = orderInfo.Address;
        Label4.Text = orderInfo.Email;
        //取
        //var memberShipping = MemberShippingUtility.GetMemberShipping(orderInfo.MemberID);
        //Label1.Text = memberShipping.

        //var shippingMember = MemberShippingUtility.GetShippingByName(orderInfo.ShipName);

        //Label1.Text = shippingMember.Name;
        //Label2.Text = shippingMember.Phone;
        //Label3.Text = shippingMember.Address;
        //Label4.Text = shippingMember.Email;

        var detailList = OrderDetailUtility.GetDetailWithProduct(int.Parse(Request.QueryString["id"]));
        var productList = detailList.Select(x => new { x.Product.ProductID, x.Product.ProductName, x.Product.ImageFile, x.Product.Price, x.Count }).ToList();

        Repeater1.DataSource = productList;
        Repeater1.DataBind();

        //商品小計
        int Total = 0;
        foreach (var item in productList)
        {
            Total += item.Count * item.Price;
            Label11.Text = Total.ToString();
        }
        //商品總計
        if (orderInfo.DiscountPrice == null)
        {
            Label13.Text = Total.ToString();
        }
        else
        {
            Label13.Text = $"{ Total - orderInfo.DiscountPrice}";
        }
        //付款方式
        switch (detailList[0].Payment.ToString())
        {
            case "1":
                Label8.Text = "刷卡";
                break;
            case "2":
                Label8.Text = "匯款";
                break;
            case "3":
                Label8.Text = "貨到付款";
                break;
        }
        //取貨方式
        switch (detailList[0].PickUp.ToString())
        {
            case "1":
                Label9.Text = "宅配";
                break;
            case "2":
                Label9.Text = "超商";
                break;
            case "3":
                Label9.Text = "門市自取";
                break;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./OrderList.aspx");
    }
}

