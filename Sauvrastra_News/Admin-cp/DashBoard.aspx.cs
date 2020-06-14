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
        DataSet ds = BAL_Catagory.statustic();
        if(ds.Tables.Count > 0)
        {
            lbl_news.Text = ds.Tables[0].Rows[0]["Total_News"].ToString();
            lbl_catagory.Text = ds.Tables[1].Rows[0]["Total_Catagory"].ToString();
            lbl_links.Text = ds.Tables[2].Rows[0]["Total_Youtube"].ToString();
            lbl_add.Text = ds.Tables[3].Rows[0]["Total_Add"].ToString();
        }
    }
}