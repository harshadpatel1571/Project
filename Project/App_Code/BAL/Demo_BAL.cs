using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Demo_BAL
/// </summary>
public class Demo_BAL
{
    public Demo_BAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataTable showdata()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "getdata";
        DataTable dt = new DataTable();
        return dt = commands.ExecuteQuery(cmd);
    }
}