<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="List_Old_News.aspx.cs" Inherits="Admin_cp_List_Old_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#datepicker-13").datepicker();
            $("#datepicker-13").datepicker("show");
        });
    </script>

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
                                    <%--<div class="col-lg-2">
                                        <a href="Catagory_Master.aspx" class="btn btn-default round">Add New Catagory</a>
                                    </div>--%>
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-sm-2"></div>
                                <div class='col-sm-3'>
                                    <div class="form-group">
                                        <b>To Date : </b>
                                        <div class='input-group date' id='datepicker-13'>
                                            <input type='text' class="form-control col-5" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="col-sm-1"></div>
                                <div class='col-sm-3'>
                                    <div class="form-group">
                                        <b>From Date : </b>
                                        <div class='input-group date' id='datetimepicker2'>
                                            <input type='text' class="form-control col-5" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>

                        </div>
                    </section>
                </div>
            </div>
        </section>
    </section>

</asp:Content>

