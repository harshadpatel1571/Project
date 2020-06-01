using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Form_video_links : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.check_session();
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

    protected void btn_add_Click(object sender, EventArgs e)
    {
        int link = BAL_Catagory.insert_youtube_link(txt_link.Text);
        if(link > 0)
        {
            Response.Write("<script> alert('Link Save Sucess..') </script>");
            this.Bind_Data();
            txt_link.Text = "";
        }
    }

    public void Bind_Data()
    {
        DataTable data = BAL_Catagory.get_Youtube_Link();
        grd_links.DataSource = data;
        grd_links.DataBind();
        bind_ddl_number();
    }

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_links.BottomPagerRow;
        if (gvrPager == null) return;

        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblcount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_links.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_links.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_links.PageCount.ToString();
    }
    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_links.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        grd_links.PageIndex = ddlPages.SelectedIndex;
        grd_links.DataBind();
        this.Bind_Data();
    }

    protected void grd_links_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_Delete")
        {
            int delete = BAL_Catagory.delete_status_youtube_link(Convert.ToInt32(e.CommandArgument), 1);
            if (delete > 0)
            {
                Response.Write("<script> alert('Delete Sucess..') </script>");
                Bind_Data();
            }
        }

        if (e.CommandName == "btn_Status")
        {
            int status = BAL_Catagory.delete_status_youtube_link(Convert.ToInt32(e.CommandArgument), 2);
            if (status > 0)
            {
                Bind_Data();
            }
        }
    }

    protected void grd_links_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_links.PageIndex = e.NewPageIndex;
        this.Bind_Data();
    }
}