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
            this.bind_ddl_number();
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

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_catagory.BottomPagerRow;
        if (gvrPager == null) return;

        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblcount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_catagory.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_catagory.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_catagory.PageCount.ToString();
    }

    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_catagory.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        grd_catagory.PageIndex = ddlPages.SelectedIndex;
        grd_catagory.DataBind();
        this.Bind_Data();
    }
    protected void grd_catagory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_catagory.PageIndex = e.NewPageIndex;
        this.Bind_Data();
    }
}