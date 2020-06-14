using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cp_Form_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["update_add_id"] != "" || Session["update_add_id"] != null)
            {
                DataTable dt = BAL_News.get_add_data(Convert.ToInt32(Session["update_add_id"]), 2);
                if (dt.Rows.Count > 0)
                {
                    ddl_cat.SelectedValue = dt.Rows[0]["add_cat_id"].ToString();
                    txt_link.Text = dt.Rows[0]["add_link"].ToString();
                    imgshow.Src = "img/add_image/" + dt.Rows[0]["add_image"].ToString();
                    add_container.Visible = true;
                    RFV_Img.Visible = false;
                }
            }
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

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_cat.SelectedValue == "0")
        {
            add_container.Visible = false;
        }
        else
        {
            if(ddl_cat.SelectedValue == "1")
            {
                lbl_info_size.Text = "Top Add : 364 X 97";
            }
            else
            {
                lbl_info_size.Text = "Banner: 1150 X 150";
                
            }
            add_container.Visible = true;
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        int data = BAL_News.Insert_add(txt_link.Text, Convert.ToInt32(Session["update_add_id"]), Convert.ToInt32(ddl_cat.SelectedValue));
        if (data > 0)
        {
            this.save_image(data);
            Response.Redirect("List_add.aspx");
        }
    }
    public void save_image(int id)
    {
        if (img_add.HasFile)
        {
            string str = img_add.FileName;
            var fileExt = System.IO.Path.GetExtension(img_add.FileName).Substring(1);
            if (fileExt == "jpeg" || fileExt == "jpg" || fileExt == "gif")
            {
                img_add.PostedFile.SaveAs(Server.MapPath("../Admin-cp/img/add_image/" + id + "." + fileExt));
                int image_save = BAL_News.Add_Image_Update(id, id + "." + fileExt);
            }
            else
            {
                Response.Write("<script>alert('Image not support jpg or jpeg required. || update image latter')</script>");
            }
        }
    }
}