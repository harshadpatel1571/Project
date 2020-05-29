using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_List_Old_News : System.Web.UI.Page
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

    //get all data
    [WebMethod(EnableSession = true)]
    public static string getdata(Int32 RowsPerPage, Int32 PageNumber, string fromdate, string todate)
    {
        DataTable dt = BAL_News.get_old_news_data(RowsPerPage, PageNumber,fromdate,todate);
        String JSON = JsonConvert.SerializeObject(dt);
        return JSON;
    }
}