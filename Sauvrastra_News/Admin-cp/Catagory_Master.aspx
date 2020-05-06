<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Catagory_Master.aspx.cs" Inherits="Admin_cp_Catagory_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-lg-6">
            <section class="panel">
                <header class="panel-heading">
                    Add News Catagory
                </header>
                <div class="panel-body">
                    <div class="form">
                        <div class="form-group">
                            <label for="cname" class="control-label col-lg-3">Catagory Name <span class="required">*</span></label>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="txt_catagory" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-4 col-lg-5">
                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Save" ID="btn_save" OnClick="btn_save_Click" />
                                <asp:Button runat="server" class="btn btn-default" Text="Cancel" ID="btn_cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    Advanced Table
                </header>
                <asp:GridView runat="server" ID="grd_catagory" AutoGenerateColumns="false" CssClass="table table-striped table-advance table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No.">
                            <InsertItemTemplate>
                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("cat_id") %>' CssClass="col-2"></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Catagory Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("cat_name") %>' CssClass="col-2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </section>
        </div>
    </div>

</asp:Content>

