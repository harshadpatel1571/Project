using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;

public partial class Client_cp_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetCategory()
    {
        string outdata;
        DataTable dt_BranchWise = BAL_Catagory.get_Category();
        outdata = JsonConvert.SerializeObject(dt_BranchWise);
        return outdata;
    }
    [WebMethod]
    public static string GetHomePageNews()
    {
        string outdata;
        DataTable dt_BranchWise = BAL_News.GetNews();
        outdata = JsonConvert.SerializeObject(dt_BranchWise);
        return outdata;
    }
}