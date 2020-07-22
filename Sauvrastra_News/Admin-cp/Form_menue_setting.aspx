<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_menue_setting.aspx.cs" Inherits="Admin_cp_Form_menue_setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i>Setting</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
                        <li><i class="fa fa-bars"></i>Menue setting</li>
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
                                        <asp:Label runat="server" Text="Menue Index setting" ID="lbl_title"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div>
                                <asp:GridView runat="server" ID="grd_menue" AutoGenerateColumns="false" EmptyDataText="No Data found" CssClass="table table-striped table-advance table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No." HeaderStyle-CssClass="col-sm-1">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Catagory Name" HeaderStyle-CssClass="col-sm-9">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Index" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hid_id" runat="server" Value='<%#Eval("cat_id") %>' />
                                                <asp:TextBox runat="server" ID="txt_index" CssClass="col-sm-3 form-control round-input" Text='<%#Eval("cat_menue_id ") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <asp:Button runat="server" ID="btn_save" CssClass="btn btn-primary" Text="Save Index" OnClick="btn_save_Click"/>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

