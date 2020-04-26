<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Catagory.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#">Admin Login</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Add Catagory</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Add News</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="jumbotron">
            <div class="card border-primary col-12">
                <div class="card-header">Add Catagory</div>
                <div class="card-body col-12">
                    <div class="card-text">
                        <table class="table-responsive table-hover">
                            <tr>
                                <td>Catagory Name </td>
                                <td>
                                    <input type="text" id="txt_cat" class="form-control col-10" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <button id="btn_add" class="btn btn-success col-md-12">Save </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
