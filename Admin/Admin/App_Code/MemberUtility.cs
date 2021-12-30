using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for MemberUtility
/// </summary>
public class MemberUtility
{
    public static void Add(Member m)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Members.Add(m);
        db.SaveChanges();
    }

    public static void Update(Member m)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        db.Entry(m).State = System.Data.Entity.EntityState.Modified;
        db.SaveChanges();

    }

    public static void Delete(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        Member members = db.Members.SingleOrDefault(p => p.MemberID == id);
        if (members != null)
        {
            db.Members.Remove(members);
            db.SaveChanges();

        }
    }
    public static Member GetMember(int id)
    {  //MemberAddress.aspx?id{0} 會員常用地址
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Members.SingleOrDefault(p => p.MemberID == id);
    }
    public static List<Member> GetMembers()
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.Members. ToList();
    }

    public static Member GetMember(string userName, string password, string phone, string email, string remark)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        var query = from m in db.Members
                    where (m.UserName == userName && m.Password == password && m.Phone == phone && m.Email == email && m.Remark == remark)
                    select m;
        return query.FirstOrDefault();
    }

    public static Member GetMemberByNameEmail(string userName, string email)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        var query = from m in db.Members
                    where (m.UserName == userName && m.Email == email)
                    select m;
        return query.FirstOrDefault();
    }
    public static Member GetMemberEdit(int id)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        var query = from m in db.Members
                    where (m.MemberID == id)
                    select m;
        return query.FirstOrDefault();
    }
}