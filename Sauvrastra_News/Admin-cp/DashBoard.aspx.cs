using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_cp_DashBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            this.statustic();
        }
    }
    public void check_session()
    {
        if (Session["user_name"] == "" || Session["user_name"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
    }

    public void statustic()
    {
        DataTable dt = BAL_Catagory.statustic();
        if(dt.Rows.Count > 0)
        {
            lbl_news.Text = dt.Rows[0]["Total_News"].ToString();
            lbl_catagory.Text = dt.Rows[1]["Total_News"].ToString();
            lbl_links.Text = dt.Rows[2]["Total_News"].ToString();
        }
    }
}