<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_Contact_Master.aspx.cs" Inherits="Admin_cp_Form_Contact_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                    <div class="col-lg-2">
                                        <a href="List_News_Master.aspx" class="btn btn-default round">Manage News</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="cname" class="control-label col-lg-3">News Catagory <span class="required">*</span></label>
                                    <div class="col-lg-5">
                                        <asp:DropDownList runat="server" ID="ddl_cat" AppendDataBoundItems="true"
                                            CssClass="form-control" AutoPostBack="true">
                                            <asp:ListItem Value="0">-- Select News Catagory --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddl_cat" SetFocusOnError="true"
                                            InitialValue="0" ErrorMessage="Must Select the catagory first" CssClass="label label-danger">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                               
                                <br />
                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-5">
                                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save"/>
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

