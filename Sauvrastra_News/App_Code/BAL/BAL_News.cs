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
        
    public static int Insert(int cat_id, string head_line,string short_desc, string full_desc, int id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_update_news";
        cmd.Parameters.AddWithValue("@cat_id",cat_id);
        cmd.Parameters.AddWithValue("@head_line",head_line);
        cmd.Parameters.AddWithValue("@short_desc",short_desc);
        cmd.Parameters.AddWithValue("@full_desc",full_desc);
        cmd.Parameters.AddWithValue("@id",id);
        // bellow code for return data
        cmd.Parameters.Add("@ret_id", SqlDbType.Int);
        cmd.Parameters["@ret_id"].Direction = ParameterDirection.Output;
        int data = commands.NonExecuteQuery(cmd);
        return Convert.ToInt32(cmd.Parameters["@ret_id"].Value);
    }

    public static DataTable get_news_data(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_news_data";
        cmd.Parameters.AddWithValue("@id",id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.ExecuteQuery(cmd);
    }

    public static int delete_status(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete_status_news";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.NonExecuteQuery(cmd);
    }

    public static int Image_Update(int id, string image)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "news_image_insert_update";
        cmd.Parameters.AddWithValue("@image", image);
        cmd.Parameters.AddWithValue("@id", id);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_old_news_data(int RowsPerPage, int PageNumber, string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_old_news_data";
        cmd.Parameters.AddWithValue("@RowsPerPage", RowsPerPage);
        cmd.Parameters.AddWithValue("@PageNumber", PageNumber);
        cmd.Parameters.AddWithValue("@fromdate", from_date);
        cmd.Parameters.AddWithValue("@todate", to_date);
        DataTable dt = new DataTable();
        return dt = commands.ExecuteQuery(cmd);
    }

    public static DataTable GetNews()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetHomePageData";
        return commands.ExecuteQuery(cmd);
    }
}