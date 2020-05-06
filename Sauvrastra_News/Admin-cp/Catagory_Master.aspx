<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Catagory_Master.aspx.cs" Inherits="Admin_cp_Catagory_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                   Add News Catagory
                </header>
                <div class="panel-body">
                    <div class="form">
                        <div class="form-group ">
                            <label for="cname" class="control-label col-lg-2">Full Name <span class="required">*</span></label>
                            <div class="col-lg-10">
                                <asp:TextBox runat="server" ID="txt_catagory" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save" />
                                <asp:button runat="server" class="btn btn-default" Text="Cancel" ID="btn_cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

