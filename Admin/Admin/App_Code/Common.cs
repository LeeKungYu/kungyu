using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
    public static string DBConnectionString
    {
        get
        {
            return 
                ConfigurationManager.ConnectionStrings["MeowwwoDBConnectionString1"].ConnectionString;
        }
    }
}