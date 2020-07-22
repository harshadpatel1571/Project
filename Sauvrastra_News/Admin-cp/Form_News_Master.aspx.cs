using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
            data();
            if (Session["update_news_id"] != "" || Session["update_news_id"] != null)
            {
                DataTable dt = BAL_News.get_news_data(Convert.ToInt32(Session["update_news_id"]), 2);
                if (dt.Rows.Count > 0)
                {
                    ddl_cat.SelectedValue = dt.Rows[0]["nm_cat_id"].ToString();
                    txt_title.Text = dt.Rows[0]["nm_head_line"].ToString();
                    txt_short_desc.Text = dt.Rows[0]["nm_short_desc"].ToString();
                    txt_long_desc.Text = dt.Rows[0]["nm_full_desc"].ToString();
                    txt_link.Text = dt.Rows[0]["nm_video_link"].ToString();
                    txt_city.Text = dt.Rows[0]["nm_city"].ToString();
                    imgshow.Src = "img/news_image/"+ dt.Rows[0]["nm_image"].ToString();
                    news_container.Visible = true;
                    RFV_Img.Visible = false;
                }
            }
            this.check_session();
        }
    }

    public void data()
    {
        DataTable dt = BAL_News.Get_catagory_for_ddl();
        if (dt.Rows.Count > 0)
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
        String str = txt_link.Text;
        String Links = str.Replace("watch?v=", "embed/");
        int data = BAL_News.Insert(Convert.ToInt32(ddl_cat.SelectedValue), txt_title.Text,txt_short_desc.Text, txt_long_desc.Text,Links,txt_city.Text,Convert.ToInt32(Session["update_news_id"]));
        if(data > 0)
        {
            this.save_image(data);
            Response.Redirect("List_News_Master.aspx");
        }
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_cat.SelectedValue == "0")
        {
            news_container.Visible = false;
        }
        else
        {
            news_container.Visible = true;
        }

    }

    public void save_image(int id)
    {
        if (img_news.HasFile)
        {
            string str = img_news.FileName;
            var fileExt = System.IO.Path.GetExtension(img_news.FileName).Substring(1);
            if (fileExt == "jpeg" || fileExt == "jpg" || fileExt == "png")
            {
                img_news.PostedFile.SaveAs(Server.MapPath("../Admin-cp/img/news_image/" + id + "." + fileExt));
                int image_save = BAL_News.Image_Update(id, id + "." + fileExt);
            }
        }
    }

    public void clear()
    {
        txt_long_desc.Text = "";
        txt_short_desc.Text = "";
        txt_title.Text = "";
        txt_city.Text = "";
        ddl_cat.SelectedValue = "0";
    }
}