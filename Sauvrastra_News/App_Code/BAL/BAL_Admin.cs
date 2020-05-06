using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BAL_Admin
/// </summary>
public class BAL_Admin
{
    public BAL_Admin()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataTable Admin_login(string unm, string pass)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "check_admin_login";
        cmd.Parameters.AddWithValue("@usernm", unm);
        cmd.Parameters.AddWithValue("@password", pass);
        DataTable dt = new DataTable();
        return dt = commands.ExecuteQuery(cmd);
    }
}