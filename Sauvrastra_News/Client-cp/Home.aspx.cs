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
    public static string firstPageData()
    {
        string outdata;
        DataSet ds_firstData = BAL_News.GetFirstData();
        outdata = JsonConvert.SerializeObject(ds_firstData);
        return outdata;
    }

    [WebMethod]
    public static string GetNewsByCategory(int Cat_ID)
    {
        string outdata;
        DataTable dt_BranchWise = BAL_News.GetNewsbyCategory(Cat_ID);
        outdata = JsonConvert.SerializeObject(dt_BranchWise);
        return outdata;
    }
}