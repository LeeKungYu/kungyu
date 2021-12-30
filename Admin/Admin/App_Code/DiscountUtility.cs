using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DiscountUtility
/// </summary>
public class DiscountUtility
{
    public static List<Discount> GetDiscount()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Discounts.ToList();
    }
    public static void Delete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        Discount discount = db.Discounts.SingleOrDefault(p => p.Id == id);
        if (discount != null)
        {
            db.Discounts.Remove(discount);
            db.SaveChanges();

        }
    }
    public static void Add(Discount d)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Discounts.Add(d);
        db.SaveChanges();
    }
   
}