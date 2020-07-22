<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="IP_check.aspx.cs" Inherits="Admin_cp_IP_check" %>

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
                        <li><i class="fa fa-bars"></i>Youtube News</li>
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
                                        <asp:Label runat="server" Text="Youtube Video Links" ID="lbl_title"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <br />
                                    <asp:Button runat="server" Text="Add Link" ID="btn_add" CssClass="btn btn-primary col-sm-4" OnClientClick="isValid()" OnClick="btn_add_Click" />
                                </div>
                            </div>
                            <br />
                            <div>
                                <asp:GridView ID="grd_ip" runat="server" AutoGenerateColumns="false"
                                    EmptyDataText="No Data Found" CssClass="table table-striped table-advance table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No." HeaderStyle-CssClass="col-sm-1">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="News id" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_link" runat="server" Text='<%#Eval("nm_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="User ip" HeaderStyle-CssClass="col-sm-8">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_link" runat="server" Text='<%#Eval("user_ip") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

