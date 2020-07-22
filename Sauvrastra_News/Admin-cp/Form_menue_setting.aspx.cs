using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_cp_Form_menue_setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.check_session();
            this.get_menue();
        }
    }

    public void check_session()
    {
        if (Session["user_name"] == "" || Session["user_name"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
    }

    public void get_menue()
    {
        Int32 id = Convert.ToInt32(Session["update_cat_id"]);
        DataTable dt = BAL_Catagory.get_data(id, 1);
        if (dt.Rows.Count > 0)
        {
            grd_menue.DataSource = dt;
            grd_menue.DataBind();
        }
    }


    protected void btn_save_Click(object sender, EventArgs e)
    {
        int count = 0;

        foreach(GridViewRow grd in grd_menue.Rows)
        {
            TextBox index = (TextBox)grd.FindControl("txt_index");
            HiddenField hid = (HiddenField)grd.FindControl("hid_id");

            int update = BAL_Catagory.Update_menue_index(Convert.ToInt32(hid.Value), Convert.ToInt32(index.Text));
            if(update > 0)
            {
                count = count + 1;
            }
        }
        Response.Write("<script>alert('Total "+count.ToString()+" Menue Updated')</script>");
        this.get_menue();
    }
}