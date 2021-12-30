using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderListUtility
/// </summary>
public class OrderListUtility
{
    public static List<OrderList> GetOrderList()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderLists.ToList();
  
    }
    public static List<OrderList> GetOrderListOrderByState()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderLists.OrderBy(o=>o.State).ToList();

    }
    //訂單狀態倒序
    public List<OrderList> GetLists(int memberID)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        List<OrderList> oList = db.OrderLists.Where(m => m.MemberID == memberID).Select(m => new OrderList()
        {
            MemberID = m.MemberID,
            OrderID = m.OrderID,
            OrderDate = m.OrderDate,
            ShippedDate = m.ShippedDate,
            Email = m.Email,
            Phone = m.Phone,
            Address = m.Address,
            State = m.State
        }).ToList();

        return oList.OrderByDescending(m => m.State).ToList();

    }
    public static List<OrderList> GetOrderLists(int memberID)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderLists.Where(o => o.MemberID == memberID).OrderByDescending(o=>o.OrderID).ToList();
    }

    public static OrderList GetOrderList(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.OrderLists.SingleOrDefault(o => o.OrderID == id);
    }
   

   
}