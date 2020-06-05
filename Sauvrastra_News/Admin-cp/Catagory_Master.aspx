<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Catagory_Master.aspx.cs" Inherits="Admin_cp_Catagory_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i>News</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="DashBoard">Home</a></li>
                        <li><i class="fa fa-bars"></i>Catagory</li>
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
                                        <asp:Label runat="server" Text="Add Catagory" ID="lbl_title"></asp:Label>
                                    </div>
                                    <div class="col-lg-2">
                                        <a href="Form_Contact_Master.aspx" class="btn btn-default round">Manage Catagory</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="cname" class="control-label col-lg-3">Catagory Name <span class="required">*</span></label>
                                    <div class="col-lg-3">
                                        <asp:TextBox runat="server" ID="txt_catagory" CssClass="form-control" require="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_catagory" 
                                            ErrorMessage="Enter News Catagory" CssClass="label label-danger" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-5">
                                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save" OnClick="btn_save_Click" />
                                        &nbsp; &nbsp
                                        <a href="List_catagory.aspx" class="btn btn-default">Cancel</a>
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

