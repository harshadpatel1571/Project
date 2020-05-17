using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class List_catagory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            Session.Remove("update_cat_id");
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
        Int32 id = Convert.ToInt32(Session["update_cat_id"]);
        DataTable dt = BAL_Catagory.get_data(id,1);
        if (dt.Rows.Count > 0)
        {
            grd_catagory.DataSource = dt;
            grd_catagory.DataBind();
        }
    }

    protected void grd_catagory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_Edit")
        {
            Session["update_cat_id"] = e.CommandArgument.ToString();
            Response.Redirect("Catagory_Master.aspx");
        }

        if (e.CommandName == "btn_Delete")
        {
            int delete = BAL_Catagory.delete_status(Convert.ToInt32(e.CommandArgument), 1);
            if (delete > 0)
            {
                Response.Write("<script> alert('Delete Sucess..') </script>");
                Bind_Data();
            }
        }

        if (e.CommandName == "btn_Status")
        {
            int status = BAL_Catagory.delete_status(Convert.ToInt32(e.CommandArgument), 2);
            if (status > 0)
            {
                Bind_Data();
            }
        }
    }
}