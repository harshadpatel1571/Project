<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="List_add.aspx.cs" Inherits="Admin_cp_List_add" %>

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
                        <li><i class="fa fa-bars"></i>Advertisement</li>
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
                                        <asp:Label runat="server" Text="Advertisement List" ID="lbl_title"></asp:Label>
                                    </div>
                                    <div class="col-lg-2">
                                        <a href="Form_add.aspx" class="btn btn-default round">Add Advertisement</a>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <asp:GridView runat="server" ID="grd_news" AutoGenerateColumns="false" CssClass="table table-striped table-advance table-hover"
                                OnRowCommand="grd_news_RowCommand" EmptyDataText="No Data Found.." AllowPaging="true" PageSize="10" OnPageIndexChanging="grd_news_PageIndexChanging">

                                <PagerTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:ImageButton runat="server" ID="btnfirst" ImageUrl="~/Admin-cp/img/buttons/Firat.png" Width="15" Height="15" CommandArgument="First" CommandName="Page" />
                                            </td>
                                            <td>
                                                <asp:ImageButton runat="server" ID="btnprev" ImageUrl="~/Admin-cp/img/buttons/Prev.png" Width="20" Height="20" CommandArgument="Prev" CommandName="Page" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddpage" runat="server" OnSelectedIndexChanged="ddpage_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </td>
                                            <td><b>Of Page &nbsp </b>
                                                <asp:Label ID="lblcount" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:ImageButton runat="server" ID="btnnext" ImageUrl="~/Admin-cp/img/buttons/Next.png" Width="20" Height="20" CommandArgument="Next" CommandName="Page" />
                                            </td>
                                            <td>
                                                <asp:ImageButton runat="server" ID="btnlast" ImageUrl="~/Admin-cp/img/buttons/Last.png" Width="15" Height="15" CommandArgument="Last" CommandName="Page" />
                                            </td>
                                        </tr>
                                    </table>
                                </PagerTemplate>

                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No." HeaderStyle-CssClass="col-sm-1">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add Catagory" HeaderStyle-CssClass="col-sm-1">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_cat" runat="server" Text='<%#Eval("add_cat_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add Date" HeaderStyle-CssClass="col-sm-1">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_date" runat="server" Text='<%#Eval("add_date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add Link" HeaderStyle-CssClass="col-sm-6">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_link" runat="server" Text='<%#Eval("add_link") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View Image" HeaderStyle-CssClass="col-sm-1">
                                        <ItemTemplate>
                                            <a href='<%#Eval("add_image") %>'>View</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-sm-3">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ImageUrl='<%#Eval("add_status") %>' Width="20" Height="20" CommandName="btn_Status" CommandArgument='<%#Eval("add_id") %>' />
                                            &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Edit.png" Width="20" Height="20" CommandName="btn_Edit" CommandArgument='<%#Eval("add_id") %>' />
                                            &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Delete.png" Width="20" Height="20" CommandName="btn_Delete" CommandArgument='<%#Eval("add_id") %>' />
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

