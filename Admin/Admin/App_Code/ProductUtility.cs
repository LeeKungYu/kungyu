using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductUtility
/// </summary>
public class ProductUtility
{
    public static void Add(Product p)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Products.Add(p);
        db.SaveChanges();
    }
    public static void Update(Product p)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Entry(p).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();
    }
    public static void Delete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        Product product = db.Products.SingleOrDefault(p => p.ProductID == id);
        if (product != null)
        {
            db.Products.Remove(product);
            db.SaveChanges();

        }
    }
    public static List<Product> GetProducts()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Products.OrderByDescending(p => p.ProductID).ToList();
    }

    public static Product GetProduct(int id)
    {  //ProductEdit.aspx?id{0}
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Products.SingleOrDefault(p => p.ProductID == id);
    }
    public static Product GetProducts(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Products.SingleOrDefault(p => p.ProductID == id);
    }

}