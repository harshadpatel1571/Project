using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_List_News_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            Session.Remove("update_news_id");
            this.Bind_Data();
        }
    }

    public void check_session()
    {
        if (Session["user_name"] == "" || Session["user_name"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
    }

    public void Bind_Data()
    {
        DataTable dt = BAL_News.get_news_data(0,1);
        if (dt.Rows.Count > 0)
        {
            grd_news.DataSource = dt;
            grd_news.DataBind();
        }
    }

    protected void grd_news_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "btn_Edit")
        {
            Session["update_news_id"] = e.CommandArgument.ToString();
            Response.Redirect("Form_News_Master.aspx");
        }

        if (e.CommandName == "btn_Delete")
        {
            int delete = BAL_News.delete_status(Convert.ToInt32(e.CommandArgument), 1);
            if (delete > 0)
            {
                Response.Write("<script> alert('Delete Sucess..') </script>");
                Bind_Data();
            }
        }

        if (e.CommandName == "btn_Status")
        {
            int status = BAL_News.delete_status(Convert.ToInt32(e.CommandArgument), 2);
            if (status > 0)
            {
                Bind_Data();
            }
        }
    }
}