using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MemberShipping
/// </summary>
public class MemberShippingUtility
{
    public static List<MemberShipping> GetMemberShipping(int memberId)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MemberShippings.Where(m=> m.MemberID == memberId).ToList();
    }
    public static List<MemberShipping> GetShipping(int MemberID)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        return db.MemberShippings.Where(o => o.MemberID == MemberID).ToList();
    }

    public static MemberShipping GetShippingByName(int memberID)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();

        return db.MemberShippings.SingleOrDefault(o => o.MemberID == memberID);
    }


}