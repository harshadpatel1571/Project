<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Form_video_links.aspx.cs" Inherits="Admin_cp_Form_video_links" %>

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
                                <div class="col-sm-3">
                                </div>
                                <div class='col-sm-3'>
                                    <b>Past Youtube Link : </b>
                                    <asp:TextBox runat="server" ID="txt_link" CssClass="form-control"></asp:TextBox>
                                    <asp:Label runat="server" ID="Lbl_Error" CssClass="label label-danger"></asp:Label>
                                    <%--<asp:RequiredFieldValidator runat="server" ID="RFV_link" ControlToValidate="txt_link" SetFocusOnError="true"
                                            ErrorMessage="Insert Proper Link" CssClass="" ValidationExpression="http(s)?://(www\.)?(youtu\.be|youtube\.com)[\w-/=&?]+">
                                            </asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-sm-4">
                                    <br />
                                    <asp:Button runat="server" Text="Add Link" ID="btn_add" CssClass="btn btn-primary col-sm-4" OnClientClick="isValid()" OnClick="btn_add_Click" />
                                </div>
                            </div>
                            <br />
                            <div>
                                <asp:GridView ID="grd_links" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="grd_links_PageIndexChanging"
                                    OnRowCommand="grd_links_RowCommand" EmptyDataText="No Data Found" DataKeyNames="ym_id" CssClass="table table-striped table-advance table-hover">
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

                                        <asp:TemplateField HeaderText="News Links" HeaderStyle-CssClass="col-sm-8">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_link" runat="server" Text='<%#Eval("ym_link") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="col-sm-2">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_date" runat="server" Text='<%#Eval("ym_date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ImageUrl='<%#Eval("ym_status") %>' Width="20" Height="20" CommandName="btn_Status" CommandArgument='<%#Eval("ym_id") %>' />
                                                &nbsp; | &nbsp;
                                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Delete.png" Width="20" Height="20" CommandName="btn_Delete" CommandArgument='<%#Eval("ym_id") %>' />
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

