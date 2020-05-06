using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_cp_Catagory_Master : System.Web.UI.Page
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

    protected void btn_save_Click(object sender, EventArgs e)
    {
        int save = BAL_Catagory.insert(txt_catagory.Text);
        if (save > 0)
        {
            Response.Write("<script> alert('Data Saved.') </script>");
            txt_catagory.Text = "";
        }
        else
        {
            Response.Write("<script> alert('Error') </script>");
        }
    }

    public void Bind_Data()
    {
        DataTable dt = BAL_Catagory.get_data();
        if (dt.Rows.Count > 0)
        {
            grd_catagory.DataSource = dt;
            grd_catagory.DataBind();
        }
    }
}