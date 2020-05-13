using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BAL_News
/// </summary>
public class BAL_News
{
    public BAL_News()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DataTable Get_catagory_for_ddl()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_catagory_for_dropdown";
        return commands.ExecuteQuery(cmd);
    }

    public static int Insert(int cat_id, string head_line, string image, string short_desc, string full_desc, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_update_news";
        cmd.Parameters.AddWithValue("@cat_id",cat_id);
        cmd.Parameters.AddWithValue("@head_line",head_line);
        cmd.Parameters.AddWithValue("@image",image);
        cmd.Parameters.AddWithValue("@short_desc",short_desc);
        cmd.Parameters.AddWithValue("@full_desc",full_desc);
        cmd.Parameters.AddWithValue("@query",query);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_news_data(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_news_data";
        cmd.Parameters.AddWithValue("@id",id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.ExecuteQuery(cmd);
    }
}