
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

    public static int insert(string cat_name,int up_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_catagory";
        cmd.Parameters.AddWithValue("@cat_name", cat_name);
        cmd.Parameters.AddWithValue("@up_id", up_id);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_data(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_catagory";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
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
    public static DataTable get_Category()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_catagory_for_dropdown";
        return commands.ExecuteQuery(cmd);
    }

    // code for add youtube links

    public static int insert_youtube_link(string cat_name)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_youtube_link";
        cmd.Parameters.AddWithValue("@link", cat_name);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_Youtube_Link()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Get_youtube_link";
        return commands.ExecuteQuery(cmd);
    }

    public static int delete_status_youtube_link(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete_status_youtube";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_active_Link()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_active_youtube_links";
        return commands.ExecuteQuery(cmd);
    }
    
}