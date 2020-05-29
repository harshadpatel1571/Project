<%@ Page Title="" Language="C#" MasterPageFile="~/Admin-cp/Admin_mst.master" AutoEventWireup="true" CodeFile="List_Old_News.aspx.cs" Inherits="Admin_cp_List_Old_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div ng-app="myApp" ng-controller="BZ" id="content">

        <section id="main-content">
            <section class="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header"><i class="fa fa fa-bars"></i>News</h3>
                        <ol class="breadcrumb">
                            <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
                            <li><i class="fa fa-bars"></i>Old News</li>
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
                                            <asp:Label runat="server" Text="Old News List" ID="lbl_title"></asp:Label>
                                        </div>
                                        <%--<div class="col-lg-2">
                                        <a href="Catagory_Master.aspx" class="btn btn-default round">Add New Catagory</a>
                                    </div>--%>
                                    </div>
                                </div>
                            </header>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-4"></div>
                                    <div class='col-sm-3'>
                                        <div class="form-group">
                                            <b>Select Date : </b>
                                            <input type="text" name="datefilter" class="form-control col-3" id="date" ng-model="date" ng-change="GetAllList(0, 1,picker.startDate,picker.endDate)"/>
                                            <script type="text/javascript">
                                                $(function () {

                                                    $('input[name="datefilter"]').daterangepicker({
                                                        autoUpdateInput: false,
                                                        locale: {
                                                            cancelLabel: 'Clear'
                                                        }
                                                    });

                                                    $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                                                        $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
                                                    });

                                                    $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                                                        $(this).val('');
                                                    });

                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <br />
                                    <table class="table table-striped table-advance table-hover">
                                        <tr>
                                            <th>Sr.No. </th>
                                            <th>Catagory </th>
                                            <th>Head Lines </th>
                                            <th>Actions </th>
                                        </tr>
                                        <tr  ng-repeat="c in data">
                                            <td> {{c.SrNo}} </td>
                                            <td> {{c.cat_name}} </td>
                                            <td> {{c.nm_head_line}} </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="img/buttons/Firat.png" height="20" width="20" ng-click="GetAllList(0,1,'',1,1)" />
                                            </td>
                                            <td>
                                                <img src="img/buttons/Prev.png" height="25" width="25" ng-click="GetAllList(NavValue,2,'',1,1)" />
                                            </td>
                                            <td>&nbsp; <b>Page</b> &nbsp; </td>
                                            <td>
                                                <input type="tel" class="form-control" size="3" ng-model="NavValue" value="{{NavValue}}" onkeydown="return OnlyNumber(event)" />
                                            </td>
                                            <td>&nbsp; <b>of {{TotalPage}} </b>&nbsp; </td>
                                            <td>
                                                <img src="img/buttons/see.png" height="20" width="20" ng-click="GetAllList(NavValue,3,'',1,1)" />
                                                &nbsp;
                                            </td>
                                            <td>
                                                <img src="img/buttons/Next.png" height="25" width="25" ng-click="GetAllList(NavValue,4,'',1,1)" />
                                            </td>
                                            <td>
                                                <img src="img/buttons/Last.png" height="20" width="20" ng-click="GetAllList(TotalPage,5,'',1,1)" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </div>
    <script>
        var myApp = angular.module("myApp", []);

        myApp.controller("BZ", function ($scope, $http) {

            //get all data.
            $scope.GetAllList = function (pagenNo, navType, todate,fromdate) {

                if (pagenNo == 0 && navType == 1) {
                    $scope.NavValue = parseInt(pagenNo) + 1;
                }
                else if (pagenNo > 0 && navType == 2) {
                    if ($scope.NavValue == 1) { }
                    else {
                        $scope.NavValue = parseInt(pagenNo) - 1;
                    }
                }
                else if (navType == 3) {
                    if (parseInt(pagenNo) > parseInt($scope.TotalPage)) {
                        $scope.NavValue = $scope.TotalPage;
                    }
                    else if (parseInt(pagenNo) == 0) {
                        $scope.NavValue = 1;
                    }
                    else if (pagenNo == null) {
                        $scope.NavValue = 1;
                    }
                }
                else if (navType == 4) {
                    $scope.NavValue = parseInt(pagenNo) + 1;

                    if (parseInt($scope.NavValue) > parseInt($scope.TotalPage)) {
                        $scope.NavValue = $scope.TotalPage;
                    }
                }
                else if (navType == 5) {
                    $scope.NavValue = parseInt(pagenNo);
                }

                var httpEdit = {
                    method: "POST",
                    url: "/List_Old_News.aspx/getdata",
                    headers: { 'Content-Type': 'application/json' },
                    data: {
                        RowsPerPage: 10,
                        PageNumber: $scope.NavValue,
                        todate: $("#date").val(picker.startDate),
                        fromdate: $("#date").val(picker.endDate)
                    }
                }
                $http(httpEdit).success(function (mRes) {
                    var obj = mRes;
                    $scope.data = angular.fromJson(mRes.d);
                    var m = angular.fromJson(mRes.d);
                    $scope.FirstRecord = m[0].FirstRecord;
                    $scope.LastRecord = m[0].LastRecord;
                    $scope.TotalRecord = m[0].TotalRecord;
                    $scope.TotalPage = m[0].TotalPage;
                });
            };
            $scope.GetAllList(0, 1,picker.startDate,picker.endDate);
                        
            ////Delete Data.
            //$scope.Delete = function (E_id, S_value) {
            //    //alert(E_id);
            //    var httpEdit = {
            //        method: "POST",
            //        url: "/event_display.aspx/Delete",
            //        headers: { 'Content-Type': 'application/json' },
            //        data: {
            //            id: E_id,
            //            query: S_value
            //        }
            //    }
            //    $http(httpEdit).success(function (mRes) {
            //        alert("Data Deleted Sucess.");
            //        $scope.GetAllList(0, $("#text").val(), '');
            //        //window.location.href = "/user_details.aspx";
            //    });
            //};
        });
    </script>

</asp:Content>
