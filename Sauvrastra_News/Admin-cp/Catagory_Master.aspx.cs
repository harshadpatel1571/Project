using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Catagory_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
}