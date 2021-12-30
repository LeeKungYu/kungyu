<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Threading;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{


    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public void Update(int memberId, string userName, string phone, string email, string address, string remark)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        Member aa = db.Members.SingleOrDefault(m => m.MemberID == memberId);
        aa.MemberID = memberId;
        aa.UserName = userName;
        aa.Phone = phone;
        aa.Email = email;
        aa.Address = address;
        aa.Remark = remark;
        db.SaveChanges();
    }
    [WebMethod]
    public void Delete(int memberId)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Members.SingleOrDefault(m => m.MemberID == memberId);

        MemberUtility.Delete(memberId);
    }

    [WebMethod]
    public MemberResult GetMember(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Members.Where(m => m.MemberID == id).Select(c => new MemberResult()
        {
            MemberID = c.MemberID,
            UserName = c.UserName,
            Password = c.Password,
            Email = c.Email,
            Phone = c.Phone,
            Address = c.Address,
            JoinDate = c.JoinDate,
            EDM = c.EDM.Value,
            Gender = c.Gender,
            BirthDate = c.BirthDate.Value,
            Remark = c.Remark
        }).FirstOrDefault();
    }

    // OrderList.aspx
    [WebMethod]
    public OrderListResult GetOrderList(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderLists.Where(o => o.OrderID == id).Select(r => new OrderListResult()
        {
            OrderID = r.OrderID,
            ShipName = r.ShipName,
            Address = r.Address,
            ShippedDate = r.ShippedDate,
            State = r.State

        }).FirstOrDefault();
    }

    [WebMethod]
    public void UpdateForOrder(int orderId, string shipName, string address, string state, string shippedDate)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        OrderList oo = db.OrderLists.SingleOrDefault(o => o.OrderID == orderId);
        oo.OrderID = orderId;
        oo.ShipName = shipName;
        oo.Address = address;
        oo.ShippedDate = shippedDate;
        oo.State = state;
        db.SaveChanges();
    }

    //Discount.aspx
    [WebMethod]
    public DiscountResult GetDiscount(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Discounts.Where(d => d.Id == id).Select(n => new DiscountResult()
        {
            Id = n.Id,
            Name = n.Name,
            Code = n.Code,
            Price = n.Price,
            BeginDate = n.BeginDate,
            EndDate = n.EndDate
        }).FirstOrDefault();
    }
    [WebMethod]
    public void DiscountUpdate(int id, string name, string code, int price, string beginDate, string endDate)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        Discount dd = db.Discounts.SingleOrDefault(d => d.Id == id);
        dd.Id = id;
        dd.Name = name;
        dd.Code = code;
        dd.Price = price;
        dd.BeginDate = beginDate;
        dd.EndDate = endDate;
        db.SaveChanges();
    }
    [WebMethod]
    public void DiscountDelete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Discounts.SingleOrDefault(ddd => ddd.Id == id);

        DiscountUtility.Delete(id);
    }

    //MessasgeBox.aspx   刪除重複留言
    [WebMethod]
    public void MessageDelete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Discounts.SingleOrDefault(ddd => ddd.Id == id);

        MessageUtility.Delete(id);
    }


    /// <summary>
    /// 
    /// </summary>
    public class MemberResult
    {
        public int MemberID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public DateTime? JoinDate { get; set; }
        public int EDM { get; set; }
        public string Gender { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Remark { get; set; }
    }
    public class OrderListResult
    {
        public int MemberID { get; set; }
        public int OrderID { get; set; }
        public string ShippedDate { get; set; }
        public string ShipName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string DiscountName { get; set; }
        public int DiscountPrice { get; set; }
    }
    public class DiscountResult
    {
        public int Id { get; set; }
        public String Name { get; set; }
        public String Code { get; set; }
        public int Price { get; set; }
        public string BeginDate { get; set; }
        public string EndDate { get; set; }
    }
}