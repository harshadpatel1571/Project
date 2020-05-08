<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="Catagory_Master.aspx.cs" Inherits="Admin_cp_Catagory_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-lg-6">
            <section class="panel">
                <header class="panel-heading">
                  <b> Add Catagory </b>
                </header>
                <div class="panel-body">
                    <div class="form">
                        <div class="form-group">
                            <label for="cname" class="control-label col-lg-3">Catagory Name <span class="required">*</span></label>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="txt_catagory" CssClass="form-control"></asp:TextBox>
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
                   <b> Catagory List </b>
                </header>
                <asp:GridView runat="server" ID="grd_catagory" AutoGenerateColumns="false" CssClass="table table-striped table-advance table-hover"
                    OnRowCommand="grd_catagory_RowCommand">
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
                                <asp:ImageButton runat="server" ImageUrl='<%#Eval("cat_status") %>' Width="20" Height="20" CommandName="btn_Status" CommandArgument='<%#Eval("cat_id") %>'/> &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Edit.png" Width="20" Height="20" CommandName="btn_Edit" CommandArgument='<%#Eval("cat_name") %>'/> &nbsp; | &nbsp;
                                <asp:ImageButton runat="server" ImageUrl="~/Admin-cp/img/buttons/Delete.png" Width="20" Height="20" CommandName="btn_Delete" CommandArgument='<%#Eval("cat_id") %>'/> &nbsp;  &nbsp;
                            </ItemTemplate> <%--// Active.png--%>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </section>
        </div>
    </div>

</asp:Content>

