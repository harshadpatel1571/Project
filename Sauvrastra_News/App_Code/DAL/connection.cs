using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
/// <summary>
/// Summary description for connection
/// </summary>
public class connection
{
	public connection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static SqlConnection connect()
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        return con;
    }

    public static SqlConnection connection_open()
    {
        SqlConnection con = connect();
        con.Open();
        return con;
    }

    public static void connection_close()
    {
        SqlConnection con = connect();
        con.Open();
        con.Dispose();
        GC.Collect();
    }
}