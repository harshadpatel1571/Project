using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_List_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            Session.Remove("update_add_id");
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
        DataTable dt = BAL_News.get_add_data(0, 1);
        if (dt.Rows.Count > 0)
        {
            grd_news.DataSource = dt;
            grd_news.DataBind();
            this.bind_ddl_number();
        }
    }

    protected void grd_news_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "btn_Edit")
        {
            Session["update_add_id"] = e.CommandArgument.ToString();
            Response.Redirect("Form_add.aspx");
        }

        if (e.CommandName == "btn_Delete")
        {
            DataTable data = BAL_News.get_add_data(Convert.ToInt32(e.CommandArgument), 2);
            string file_name = data.Rows[0]["add_image"].ToString();
            string path = Server.MapPath("../Admin-cp/img/add_image/" + file_name);
            FileInfo file = new FileInfo(path);
            if (file.Exists)
            {
                file.Delete();
                int delete = BAL_News.add_delete_status(Convert.ToInt32(e.CommandArgument), 1);
                if (delete > 0)
                {
                    Response.Write("<script> alert('Delete Sucess..') </script>");
                    Bind_Data();
                }
            }
        }
        
        if (e.CommandName == "btn_Status")
        {
            int status = BAL_News.add_delete_status(Convert.ToInt32(e.CommandArgument), 2);
            if (status > 0)
            {
                Bind_Data();
            }
        }
    }

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_news.BottomPagerRow;
        if (gvrPager == null) return;

        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblcount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_news.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_news.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_news.PageCount.ToString();
    }
    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_news.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        grd_news.PageIndex = ddlPages.SelectedIndex;
        grd_news.DataBind();
        this.Bind_Data();
    }


    protected void grd_news_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_news.PageIndex = e.NewPageIndex;
        this.Bind_Data();
    }
}