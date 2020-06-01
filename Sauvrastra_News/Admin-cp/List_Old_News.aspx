<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="List_Old_News.aspx.cs" Inherits="Admin_cp_List_Old_News" %>

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
                        <li><i class="fa fa-bars"></i>Old News</li>
                    </ol>
                </div>
            </div>
            <%-- <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">--%>
            <%--<ContentTemplate>--%>
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="form">
                                <div class="form-group">
                                    <div class="col-lg-10">
                                        <asp:Label runat="server" Text="Old News List" ID="lbl_title"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class='col-sm-3'>

                                    <b>Select Date : </b>
                                    <input type="text" name="datefilter" class="form-control col-3" autocomplete="off" />
                                    <script type="text/javascript">
                                        $(function () {

                                            $('input[name="datefilter"]').daterangepicker({
                                                autoUpdateInput: false,
                                                locale: {
                                                    cancelLabel: 'Clear'
                                                }
                                            });

                                            $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                                                $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
                                                $('#<%=fromdate.ClientID %>').val(picker.startDate.format('DD/MM/YYYY'));
                                                        $('#<%=todate.ClientID %>').val(picker.endDate.format('DD/MM/YYYY'));

                                                    });

                                                    $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                                                        $(this).val('');
                                                        $('#<%=fromdate.ClientID %>').val('');
                                                    $('#<%=todate.ClientID %>').val('');
                                                });
                                                });
                                    </script>
                                </div>
                                <asp:HiddenField ID="fromdate" runat="server" />
                                <asp:HiddenField ID="todate" runat="server" />
                                <div class="col-sm-4">
                                    <br />
                                    <asp:Button runat="server" Text="Load" ID="btn_load" CssClass="btn btn-primary col-sm-4" OnClick="btn_load_Click" />
                                </div>
                            </div>
                            <br />
                            <div>
                                <asp:GridView ID="grd_old_news" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grd_old_news_PageIndexChanging"
                                    OnRowCommand="grd_old_news_RowCommand" EmptyDataText="No Record Found." DataKeyNames="nm_id" CssClass="table table-striped table-advance table-hover">
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
                                                    <asp:DropDownList ID="ddpage" CssClass="form-control col-sm-2" runat="server" OnSelectedIndexChanged="ddpage_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                                        <asp:TemplateField HeaderText="Catagory" HeaderStyle-CssClass="col-sm-1">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_cat" runat="server" Text='<%#Eval("cat_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Head Line" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_head" runat="server" Text='<%#Eval("nm_head_line") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short Descriptions" HeaderStyle-CssClass="col-sm-7">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_short" runat="server" Text='<%#Eval("nm_short_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View Image" HeaderStyle-CssClass="col-sm-2">
                                            <ItemTemplate>
                                                <a href='<%#Eval("nm_image") %>'>View</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-sm-3">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ImageUrl='<%#Eval("nm_status") %>' Width="20" Height="20" CommandName="btn_Status" CommandArgument='<%#Eval("nm_id") %>' />
                                                &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Delete.png" Width="20" Height="20" CommandName="btn_Delete" CommandArgument='<%#Eval("nm_id") %>' />
                                                &nbsp; | &nbsp;
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <%-- </ContentTemplate>
            </asp:UpdatePanel>--%>
        </section>
    </section>

</asp:Content>
