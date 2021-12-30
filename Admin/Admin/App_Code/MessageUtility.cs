using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MessageUtility
/// </summary>
public class MessageUtility
{
    public static MessageBox AAGetMessages(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MessageBoxes.SingleOrDefault(m => m.ID == id);
    }
    public static List<MessageBox> GetMessages()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MessageBoxes.OrderByDescending(m => m.ID).ToList();
    }

    public static void UpDate(MessageBox box)
    {
        SqlConnection cn = new SqlConnection(Common.DBConnectionString);

        SqlCommand cmd = new SqlCommand(
            "update MessageBox set Answer = @answer , ADate = @aDate where id = @id",
            cn);

        cmd.Parameters.AddWithValue("@id", box.ID);
        cmd.Parameters.AddWithValue("@answer", box.Answer);
        cmd.Parameters.AddWithValue("@aDate", box.ADate);

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        //MeowwwoDBEntities db = new MeowwwoDBEntities();
        //db.Entry(box).State = System.Data.Entity.EntityState.Modified;

        //db.SaveChanges(); 
    }
    public static void Delete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        MessageBox message = db.MessageBoxes.SingleOrDefault(p => p.ID == id);
        if (message != null)
        {
            db.MessageBoxes.Remove(message);
            db.SaveChanges();

        }
    }
    public static List<MessageBox> GetMessageMemberName()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MessageBoxes.Include(i => i.Member).ToList();
    }
    public static List<MessageBox> GetMessage(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MessageBoxes.Where(m => m.ID == id).Include(i => i.Member).ToList();
    }
   
}