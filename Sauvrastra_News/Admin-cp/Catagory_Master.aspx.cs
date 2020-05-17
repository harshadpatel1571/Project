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
            if (Session["update_cat_id"] != "" || Session["update_cat_id"] != null)
            {
                DataTable data = BAL_Catagory.get_data(Convert.ToInt32(Session["update_cat_id"]),2);
                if (data.Rows.Count > 0)
                {
                    txt_catagory.Text = data.Rows[0]["cat_name"].ToString();
                }
            }
            this.check_session();
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
        int save = BAL_Catagory.insert(txt_catagory.Text, Convert.ToInt32(Session["update_cat_id"]));
        if (save > 0)
        {
            txt_catagory.Text = "";
            Session.Remove("update_cat_id");
            Response.Redirect("List_catagory.aspx");
        }
        else
        {
            Response.Write("<script> alert('Duplicat Data Found !!') </script>");
        }
    }
}