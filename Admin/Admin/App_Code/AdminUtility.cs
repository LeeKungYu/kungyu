using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
/// <summary>
/// Summary description for AdminUtility
/// </summary>
public class AdminUtility
{

    public static Admin GetAdmin(string userName, string password)
    {
        MeowwwoDBEntities db = new MeowwwoDBEntities();
        var query = from a in db.Admins
                    where (a.admin1 == userName && a.password== password)
                    select a;
        return query.FirstOrDefault();


    }
}