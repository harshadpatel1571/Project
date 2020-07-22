<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_add.aspx.cs" Inherits="Admin_cp_Form_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        var loadFile2 = function (event) {
            var output = document.getElementById('ContentPlaceHolder1_imgshow');
            output.src = URL.createObjectURL(event.target.files[0]);

            var imageInput = document.getElementById('ContentPlaceHolder1_img_add');
            var file = imageInput.value;
            file = file.substring(file.lastIndexOf('.') + 1).toLowerCase();
            
            if (file != "jpeg" && file != "jpg" && file != "gif") {
                alert('Please select jpeg or jpg or gif image file');
            }
        };
    </script>

    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i>News</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
                        <li><i class="fa fa-bars"></i>Advertisement</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="form">
                                <div class="form-group">
                                    <div class="col-lg-10">
                                        <asp:Label runat="server" Text="Add News" ID="lbl_title"></asp:Label>
                                    </div>
                                    <div class="col-lg-2" style="text-align:right;">
                                        <a href="List_add.aspx" class="btn btn-primary round">Manage Advertisement</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="cname" class="control-label col-lg-3"><b>Select add type </b><span class="required">*</span></label>
                                    <div class="col-lg-5">
                                        <asp:DropDownList runat="server" ID="ddl_cat" AppendDataBoundItems="true"
                                            CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged">
                                            <asp:ListItem Value="0">-- Select type --</asp:ListItem>
                                            <asp:ListItem Value="1">Top Add</asp:ListItem>
                                            <asp:ListItem Value="2">Banner Add</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_cat" SetFocusOnError="true"
                                            InitialValue="0" ErrorMessage="Must Select the catagory first" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div id="add_container" runat="server" visible="false">
                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Add Link</b></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txt_link" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="RFV_link" ControlToValidate="txt_link" SetFocusOnError="true"
                                            ErrorMessage="Insert Proper Link" CssClass="label label-danger" ValidationExpression="http(s)?://(www\.)?(youtu\.be|youtube\.com)[\w-/=&?]+">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Add Image </b><span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:FileUpload ID="img_add" runat="server" CssClass="form-control col-5 border-primary" onchange="loadFile2(event)"></asp:FileUpload>
                                            <span class="label label-info"><asp:Label runat="server" ID="lbl_info_size"></asp:Label></span>
                                            <asp:RequiredFieldValidator runat="server" ID="RFV_Img" ControlToValidate="img_add" SetFocusOnError="true"
                                                ErrorMessage="Must Select add image" CssClass="label label-danger">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-3">
                                            <img runat="server" id="imgshow" width="80" height="80" />
                                        </div>
                                    </div>
                                </div>


                                <br />
                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-5">
                                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save" OnClick="btn_save_Click" />
                                        &nbsp; &nbsp
                                        <a href="#" class="btn btn-default">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

