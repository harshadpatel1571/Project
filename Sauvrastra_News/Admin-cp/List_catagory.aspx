<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="List_catagory.aspx.cs" Inherits="List_catagory" %>

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
                        <li><i class="fa fa-bars"></i>Catagory</li>
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
                                        <asp:Label runat="server" Text="Catagory List" ID="lbl_title"></asp:Label>
                                    </div>
                                    <div class="col-lg-2">
                                        <a href="Catagory_Master.aspx" class="btn btn-default round">Add New Catagory</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <asp:GridView runat="server" ID="grd_catagory" AutoGenerateColumns="false" CssClass="table table-striped table-advance table-hover"
                                OnRowCommand="grd_catagory_RowCommand" EmptyDataText="No Data found">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No." HeaderStyle-CssClass="col-sm-1">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Catagory Name" HeaderStyle-CssClass="col-sm-9">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-sm-3">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ImageUrl='<%#Eval("cat_status") %>' Width="20" Height="20" CommandName="btn_Status" CommandArgument='<%#Eval("cat_id") %>' />
                                            &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Edit.png" Width="20" Height="20" CommandName="btn_Edit" CommandArgument='<%#Eval("cat_id") %>' />
                                            &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Delete.png" Width="20" Height="20" CommandName="btn_Delete" CommandArgument='<%#Eval("cat_id") %>' />
                                            &nbsp;  &nbsp;
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

