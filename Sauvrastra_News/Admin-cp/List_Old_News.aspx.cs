using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_List_Old_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            Session.Remove("update_news_id");
            fromdate.Value = "";
            todate.Value = "";
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
        DataTable data = BAL_News.get_old_news_data(fromdate.Value,todate.Value);
        grd_old_news.DataSource = data;
        grd_old_news.DataBind();
        bind_ddl_number();
    }

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_old_news.BottomPagerRow;
        if (gvrPager == null) return;

        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblcount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_old_news.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_old_news.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_old_news.PageCount.ToString();
    }

    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_old_news.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        grd_old_news.PageIndex = ddlPages.SelectedIndex;
        grd_old_news.DataBind();
        this.Bind_Data();
    }


    protected void grd_old_news_RowCommand(object sender, GridViewCommandEventArgs e)
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

    protected void grd_old_news_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_old_news.PageIndex = e.NewPageIndex;
        this.Bind_Data();
    }


    protected void btn_load_Click(object sender, EventArgs e)
    {
        this.Bind_Data();
        this.bind_ddl_number();
    }
}