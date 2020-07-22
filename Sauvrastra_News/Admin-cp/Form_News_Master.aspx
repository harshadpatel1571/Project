<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_News_Master.aspx.cs" Inherits="Admin_cp_Form_News_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">

        var loadFile2 = function (event) {
            debugger;
            var output = document.getElementById('ContentPlaceHolder1_imgshow');
            output.src = URL.createObjectURL(event.target.files[0]);
           
            var imageInput = document.getElementById('ContentPlaceHolder1_img_news');
            var isValid = /\.jpe?g$/i.test(imageInput.value);
            if (!isValid) {
                alert('Only jpg files allowed!');
            }
        };

        $(document).ready(function () {
            $("#<%=txt_title.ClientID %>").on('keyup', function () {
                var words = this.value.match(/\S+/g).length;
                if (words > 15) {
                    // Split the string on first 200 words and rejoin on spaces
                    var trimmed = $(this).val().split(/\s+/, 15).join(" ");
                    // Add a space at the end to keep new typing making new words
                    document.getElementById("<%=txt_title.ClientID %>").value = trimmed;
                }
                $('#lblHeadLine').text('Total Words: 15 / ' + words);
            });
        });

        $(document).ready(function () {
            $("#<%=txt_short_desc.ClientID %>").on('keyup', function () {
                var words = this.value.match(/\S+/g).length;
                if (words > 30)
                {
                    var trimmed = $(this).val().split(/\s+/, 30).join(" ");
                    document.getElementById("<%=txt_short_desc.ClientID %>").value = trimmed;
                }
                $('#lblshortdesc').text('Total Words: 30 / ' + words);
            });
        });
    </script>

    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i>News</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
                        <li><i class="fa fa-bars"></i>News</li>
                        <%--<li><i class="fa fa-square-o"></i>Pages</li>--%>
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
                                        <a href="List_News_Master.aspx" class="btn btn-primary round">Manage News</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="cname" class="control-label col-lg-3"><b>News Catagory</b> <span class="required">*</span></label>
                                    <div class="col-lg-5">
                                        <asp:DropDownList runat="server" ID="ddl_cat" AppendDataBoundItems="true"
                                            CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged">
                                            <asp:ListItem Value="0">-- Select News Catagory --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_cat" SetFocusOnError="true"
                                            InitialValue="0" ErrorMessage="Must Select the catagory first" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div id="news_container" runat="server" visible="false">
                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Head Line</b> <span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txt_title" CssClass="form-control"></asp:TextBox>
                                            <label id="lblHeadLine" class="label label-info"></label>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_title" SetFocusOnError="true"
                                            ErrorMessage="Enter New Title" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>City</b> <span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txt_city" CssClass="form-control"></asp:TextBox>
                                            <label id="lblCity" class="label label-info"></label>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_city" SetFocusOnError="true"
                                            ErrorMessage="Enter News City" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Live Youtube Link</b></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txt_link" CssClass="form-control"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator runat="server" ID="RFV_link" ControlToValidate="txt_link" SetFocusOnError="true"
                                            ErrorMessage="Insert Proper Link" CssClass="label label-danger" ValidationExpression="http(s)?://(www\.)?(youtu\.be|youtube\.com)[\w-/=&?]+">
                                            </asp:RequiredFieldValidator>--%>
                                            
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>News Image </b><span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:FileUpload ID="img_news" runat="server" CssClass="form-control col-5 border-primary" onchange="loadFile2(event)"></asp:FileUpload>
                                            <asp:RequiredFieldValidator runat="server" ID="RFV_Img" ControlToValidate="img_news" SetFocusOnError="true"
                                            ErrorMessage="Must Select News image" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-3">
                                            <img runat="server" id="imgshow" width="80" height="80" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Short Description</b> <span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="txt_short_desc" CssClass="form-control" runat="server" TextMode="MultiLine"
                                                autocomplete="off" Height="100"></asp:TextBox>
                                            <label id="lblshortdesc" class="label label-info"></label>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_short_desc" SetFocusOnError="true"
                                            ErrorMessage="Enter News short description" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cname" class="control-label col-lg-3"><b>Full Description</b> <span class="required">*</span></label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txt_long_desc" CssClass="form-control" TextMode="MultiLine" Height="400"></asp:TextBox>
                                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_long_desc" SetFocusOnError="true"
                                            ErrorMessage="Enter News full description" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-5">
                                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save" OnClick="btn_save_Click" />
                                        &nbsp; &nbsp
                                        <a href="List_News_Master.aspx" class="btn btn-default">Cancel</a>
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
