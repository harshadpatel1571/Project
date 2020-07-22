using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_cp_IP_check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.check_session();
            this.show_ip();
        }

    }

    public void show_ip()
    {
        DataTable dt = BAL_Admin.ip_check(2, 1, Request.UserHostAddress.ToString());
        if(dt.Rows.Count > 0)
        {
            grd_ip.DataSource = dt;
            grd_ip.DataBind();
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
        DataTable dt = BAL_Admin.ip_check(1, 5, Request.UserHostAddress.ToString());
        if (dt.Rows.Count > 0)
        {
            this.show_ip();
        }
    }
}