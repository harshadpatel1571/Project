using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_cp_Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        DataTable data = BAL_Admin.Admin_login(txt_username.Text,txt_pass.Text);
        if (data.Rows.Count > 0)
        {
            Session["user_name"] = data.Rows[0]["am_user_name"].ToString();
            Response.Redirect("Catagory_Master.aspx");
        }
        else
        {
            Response.Write("<script> alter('Authentication Fail !!') </script>");
        }
    }
}