﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Admin_mst : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.bind_default();
    }

    public void bind_default()
    {
        lbl_username.Text = Session["user_name"].ToString();
    }
}
