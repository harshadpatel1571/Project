using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Form_manage_views : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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

    public void Bind_Data()
    {
        DataTable dt = BAL_News.Get_data_for_fakeview(1,0,0);
        if (dt.Rows.Count > 0)
        {
            grd_views.DataSource = dt;
            grd_views.DataBind();
            this.bind_ddl_number();
        }
    }

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_views.BottomPagerRow;
        if (gvrPager == null) return;

        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblcount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_views.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_views.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_views.PageCount.ToString();
    }
    protected void ddpage_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_views.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddpage");
        grd_views.PageIndex = ddlPages.SelectedIndex;
        grd_views.DataBind();
        this.Bind_Data();
    }

    protected void grd_views_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_views.PageIndex = e.NewPageIndex;
        this.Bind_Data();
    }

    protected void grd_views_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        var a = e.CommandArgument.ToString();
        foreach (GridViewRow gvr in grd_views.Rows)
        {
            RadioButtonList rdo = (RadioButtonList)gvr.FindControl("rdo_confirm");
            HiddenField h1 = (HiddenField)gvr.FindControl("hid_id");
            TextBox txt = (TextBox)gvr.FindControl("txt_views");
            Button btn = (Button)gvr.FindControl("btn_save");

            if (btn.CommandArgument.ToString() == a)
            {
                if(rdo.SelectedValue.ToString() == "0")
                {
                    Response.Write("<script> alert('Select [Yes] for change views') </script>");
                }
                else
                {
                    DataTable update = BAL_News.Get_data_for_fakeview(2, Convert.ToInt32(h1.Value), Convert.ToInt32(txt.Text));
                    if(update.Rows.Count > 0)
                    {
                        Response.Write("<script> alert('Error to save data !!') </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Data Saved Sucess') </script>");
                        
                    }
                }
                Response.Redirect("Form_manage_views.aspx");
            }
        }
    }
}