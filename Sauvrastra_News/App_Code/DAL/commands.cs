using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

/// <summary>
/// Summary description for commands
/// </summary>
public class commands
{
    public commands()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    

    public static DataTable ExecuteQuery(SqlCommand cmd)
    {
        try
        {
            SqlConnection cn = connection.connection_open();
            DataTable dt = new DataTable();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cn;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            adpt.Fill(dt);
            return dt;
        }
        finally
        {
            connection.connection_close();
        }
    }
    
    public static int NonExecuteQuery(SqlCommand cmd)
    {
        try
        {
            SqlConnection cn = connection.connection_open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cn;
            //SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        }
        catch { }
        finally
        {
            connection.connection_close();
        }
        return cmd.ExecuteNonQuery();
    }
}