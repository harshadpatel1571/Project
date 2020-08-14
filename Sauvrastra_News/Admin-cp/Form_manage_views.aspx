<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_manage_views.aspx.cs" Inherits="Admin_cp_Form_manage_views" %>

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
                        <li><i class="fa fa-bars"></i>manage Views</li>
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
                                        <asp:Label runat="server" Text="Manage News Views" ID="lbl_title"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div>
                                <asp:GridView runat="server" ID="grd_views" AutoGenerateColumns="false" EmptyDataText="No Data found" CssClass="table table-striped table-advance table-hover"
                                    OnPageIndexChanging="grd_views_PageIndexChanging" OnRowCommand="grd_views_RowCommand" AllowPaging="true" PageSize="10">
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
                                                <%#Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Head Lines" HeaderStyle-CssClass="col-sm-7">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("nm_head_line") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Origional Views" HeaderStyle-CssClass="col-sm-1">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("nm_views_count") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View Edit" HeaderStyle-CssClass="col-sm-1">
                                            <ItemTemplate>
                                                <asp:RadioButtonList runat="server" ID="rdo_confirm" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fake View Count" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hid_id" runat="server" Value='<%#Eval("nm_id") %>' />
                                                <asp:TextBox runat="server" ID="txt_views" CssClass="form-control round-input" Text='<%#Eval("nm_fakeview") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="col-sm-4">
                                            <ItemTemplate>
                                                <asp:Button runat="server" ID="btn_save" CssClass="btn btn-primary" Text="Update" CommandArgument='<%#Eval("nm_id") %>'/>
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
