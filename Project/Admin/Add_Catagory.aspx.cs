using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }

    public void bind()
    {
        DataTable dt = Demo_BAL.showdata();
        if (dt.Rows.Count > 0)
        {
            grd_demo.DataSource = dt;
            grd_demo.DataBind();
        }
    }
}