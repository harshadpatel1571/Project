﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BAL_Catagory
/// </summary>
public class BAL_Catagory
{
    public BAL_Catagory()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int insert(string cat_name)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_catagory";
        cmd.Parameters.AddWithValue("@cat_name", cat_name);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_data()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_catagory";
        return commands.ExecuteQuery(cmd);
    }

    public static int delete_status(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete_status_catagory";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.NonExecuteQuery(cmd);
    }
}