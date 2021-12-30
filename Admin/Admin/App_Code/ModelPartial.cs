using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ModelPartial
/// </summary>
public partial class Product
{
    public Product(int id, string imgfile, string name, string category, string color, string tags, int price, int count, string productDetail)
    {
        this.ProductID = id;
        this.ImageFile = imgfile;
        this.ProductName = name;
        this.ProductCategory = category;
        this.Color = color;
        this.Tags = tags;
        this.Price = price;
        this.Count = count;
        this.ProductDetail = productDetail;

    }
    //ProductList
    //public Product()
    //{ }

    //ProductAdd
    public Product(int id, string name, string category, int price, int count, string color, string tags, string detail, string imagefile)
    {
        this.ProductID = id;
        this.ProductName = name;
        this.ProductCategory = category;
        this.Price = price;
        this.Count = count;
        this.Color = color;
        this.Tags = tags;
        this.ProductDetail = detail;
        this.ImageFile = imagefile;
    }
}

public partial class Admin
{
    public Admin(string admin, string password)
    {
        this.admin1 = admin;
        this.password = password;
    }
    public Admin()
    { }
}
public partial class Member
{
    public Member(int memberID, string userName, string password, string email, string phone, string address, DateTime joinDate, int edm, string gender, DateTime birthDate, string remark)
    {
        this.MemberID = memberID;
        this.UserName = userName;
        this.Password = password;
        this.Email = email;
        this.Phone = phone;
        this.Address = address;
        this.JoinDate = joinDate;
        this.EDM = edm;
        this.Gender = gender;
        this.BirthDate = birthDate;
        this.Remark = remark;
    }
    // for UPdate Members
    public Member(int memberId, string userName, string phone, string email, string address, string remark)
    {
        this.MemberID = memberId;
        this.UserName = userName;
        this.Phone = phone;
        this.Email = email;
        this.Address = address;
        this.Remark = remark;
    }

    public static object Join(OrderList orderList, Func<object, object> p1, Func<object, object> p2, Func<object, object, object> p3)
    {
        throw new NotImplementedException();
    }

    //public Member(int memberId, string userName, string password, string gender,string phone, string email, string address, int edm,string remark)
    //{
    //    this.MemberID = memberId;
    //    this.UserName = userName;
    //    this.Password = password;
    //    this.Gender = gender;

    //    this.Phone = phone;
    //    this.Email = email;
    //    this.Address = address;
    //    this.EDM = edm;

    //    this.Remark = remark;
    //}
    //public Member()
    //{ }
}
public partial class MemberShipping
{
    public MemberShipping(int id, int memberId, string name, string phone, string email, string address)
    {
        this.ID = id;
        this.MemberID = memberId;
        this.Name = name;
        this.Phone = phone;
        this.Email = email;
        this.Address = address;

    }
    public MemberShipping()
    { }
}
public partial class OrderList
{
    public OrderList(int memberId, int orderId, string orderDate, string shippedDate, string shipName, string email, string phone, string address, string state, string discountName, int discountPrice)
    {
        this.MemberID = memberId;
        this.OrderID = orderId;
        this.OrderDate = orderDate;
        this.ShippedDate = shippedDate;
        this.ShipName = shipName;
        this.Email = email;
        this.Phone = phone;
        this.Address = address;
        this.State = state;
        this.DiscountName = discountName;
        this.DiscountPrice = discountPrice;
    }

    public OrderList(int memberId, string shipName, string email, string phone, string address)
    {
        this.MemberID = memberId;
        this.ShipName = shipName;
        this.Email = email;
        this.Phone = phone;
        this.Address = address;

    }
    //public OrderList()
    //{ }

}
public partial class OrderDetail
{
    public OrderDetail(int id, int memberId, int productId, int orderId, int count, int payment, int pickUp)
    {
        this.ID = id;
        this.MemberID = memberId;
        this.ProductID = productId;
        this.OrderID = orderId;
        this.Count = count;
        this.Payment = payment;
        this.PickUp = pickUp;
    }
    public OrderDetail()
    {
    }

}


public partial class Discount
{
    public Discount(int id, string name, string code, int price, string beginDate, string endDate)
    {
        this.Id = id;
        this.Name = name;
        this.Code = code;
        this.Price = price;
        this.BeginDate = beginDate;
        this.EndDate = endDate;
    }
    public Discount()
    { }

}

public partial class MessageBox
{
    public MessageBox(int id, int? memberID, string title, string message, string file, string answer, string qDate, string aDate)
    {
        this.ID = id;
        this.MemberID = memberID;
        this.Title = title;
        this.Message = message;
        this.File = file;
        this.Answer = answer;
        this.QDate = qDate;
        this.ADate = aDate;
    }
    //public MessageBox(int id, string aDate, string answer)
    //{
    //    this.ID = id;
    //    this.ADate = aDate;
    //    this.Answer = answer;
    //}
    public MessageBox()
    { }
}

public partial class Payment
{
    public Payment(int id, int orderID, string cardnumber)
    {
        this.Id = id;
        this.OrderID = orderID;
        this.cardNumber = cardnumber;
    }

    public Payment()
    { }
}