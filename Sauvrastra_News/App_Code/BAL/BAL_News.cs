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
    public static DataSet GetFirstData()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Get_FirstLoadData";
        DataSet ds = new DataSet();
        return ds = commands.DataExecuteQuery(cmd);

    }

    public static DataTable Get_catagory_for_ddl()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_catagory_for_dropdown";
        return commands.ExecuteQuery(cmd);
    }
        
    public static int Insert(int cat_id, string head_line,string short_desc, string full_desc,string links,string city ,int id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_update_news";
        cmd.Parameters.AddWithValue("@cat_id",cat_id);
        cmd.Parameters.AddWithValue("@head_line",head_line);
        cmd.Parameters.AddWithValue("@short_desc",short_desc);
        cmd.Parameters.AddWithValue("@full_desc",full_desc);
        cmd.Parameters.AddWithValue("@link", links);
        cmd.Parameters.AddWithValue("@city", city);
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

    public static DataTable get_old_news_data(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_old_news_data";
        cmd.Parameters.AddWithValue("@fromdate", from_date);
        cmd.Parameters.AddWithValue("@todate", to_date);
        DataTable dt = new DataTable();
        return dt = commands.ExecuteQuery(cmd);
    }

    public static DataTable GetNewsbyCategory(int Cat_ID)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Get_catagory_wise_data";
        cmd.Parameters.AddWithValue("@cat_id", Cat_ID);
        return commands.ExecuteQuery(cmd);
    }

    // for Add 
    public static int Insert_add(string links, int id, int cat_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert_update_add";
        cmd.Parameters.AddWithValue("@link", links);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@cat_id", cat_id);
        cmd.Parameters.Add("@ret_id", SqlDbType.Int);
        cmd.Parameters["@ret_id"].Direction = ParameterDirection.Output;
        int data = commands.NonExecuteQuery(cmd);
        return Convert.ToInt32(cmd.Parameters["@ret_id"].Value);
    }

    public static int Add_Image_Update(int id, string image)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "add_image_insert_update";
        cmd.Parameters.AddWithValue("@image", image);
        cmd.Parameters.AddWithValue("@id", id);
        return commands.NonExecuteQuery(cmd);
    }

    public static DataTable get_add_data(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "get_add_data";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.ExecuteQuery(cmd);
    }

    public static int add_delete_status(int id, int query)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete_status_add";
        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@query", query);
        return commands.NonExecuteQuery(cmd);
    }

    // user view update
    public static int update_user_views(int id, int oldview, string user_ip)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update_user_views";
        cmd.Parameters.AddWithValue("@news_id", id);
        cmd.Parameters.AddWithValue("@old_view", oldview);
        cmd.Parameters.AddWithValue("@user_ip",user_ip);
        DataTable dt = commands.ExecuteQuery(cmd);
        return Convert.ToInt32(dt.Rows[0]["total_view"].ToString());
    }

}