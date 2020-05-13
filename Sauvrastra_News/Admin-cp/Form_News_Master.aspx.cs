using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Form_News_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.check_session();
            data();
        }
    }

    public void data()
    {
        DataTable dt = BAL_News.Get_catagory_for_ddl();
        if(dt.Rows.Count > 0)
        {
            ddl_cat.DataSource = dt;
            ddl_cat.DataTextField = "name";
            ddl_cat.DataValueField = "id";
            ddl_cat.DataBind();
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
        if (img_news.HasFile)
        {
            string str = img_news.FileName;
            var fileExt = System.IO.Path.GetExtension(img_news.FileName).Substring(1);
            if (fileExt == "jpeg" || fileExt == "jpg")
            {
                int savedata = BAL_News.Insert(Convert.ToInt32(ddl_cat.SelectedValue), txt_title.Text, str, txt_short_desc.Text, txt_long_desc.Text, 1);

                if (savedata > 0)
                {
                    img_news.PostedFile.SaveAs(Server.MapPath("../Admin-cp/img/news_image/" + str));
                    Response.Write("<script> alert('News Saved Sucess..') </script>");/*http://localhost:29211/Admin-cp/img/news_image/*/
                }
                else
                {
                    Response.Write("<script> alert('News Save Error!!') </script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Select Jpg or Jpeg file.') </script>");
            }
        }
        else
        {
            Response.Write("<script> alert('Select file first.') </script>");
        }
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        news_container.Visible = true;
    }

    public void clear()
    {
        txt_long_desc.Text = "";
        txt_short_desc.Text = "";
        txt_title.Text = "";
        ddl_cat.SelectedValue = "0";
    }
}