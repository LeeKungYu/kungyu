using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderDetailUtility
/// </summary>
public class OrderDetailUtility
{
    public static List<OrderDetail> GetOrderDetail(int memberID)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderDetails.Where(o => o.MemberID == memberID).ToList();
    }

    public static OrderDetail GetDetail(int id)
    { 
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderDetails.SingleOrDefault(o => o.OrderID == id);
    }
   
    public static List<OrderDetail> GetDetailWithProduct(int orderId)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderDetails.
            Where(o => o.OrderID == orderId).
            Include(o => o.Product).ToList();
    }
    public static List<OrderDetail> GetDetailWithProductaa(int memberId)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderDetails.
            Where(o => o.MemberID == memberId).
            Include(o => o.Product).ToList();
    }

}