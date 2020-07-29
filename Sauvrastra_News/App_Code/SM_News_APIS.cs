using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;

public class SM_News_APIS : System.Web.Services.WebService
{
    public SM_News_APIS()
    {
       
    }
   
    [WebMethod]
    public string firstPageData()
    {
        string outdata;
        DataSet ds_firstData = BAL_News.GetFirstData();
        outdata = JsonConvert.SerializeObject(ds_firstData);
        return outdata;
    }

    [WebMethod]
    public string GetNewsByCategory(int Cat_ID)
    {
        string outdata;
        DataTable dt_BranchWise = BAL_News.GetNewsbyCategory(Cat_ID);
        outdata = JsonConvert.SerializeObject(dt_BranchWise);
        return outdata;
    }
}
