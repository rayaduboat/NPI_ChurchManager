<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgottenPassword.aspx.cs" Inherits="ForgottenPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <title>Forgotten password reset form</title>
    <link href="assets/css/forgottenPasswordCss.css" rel="stylesheet" />
</head>
<body>
   
    <div class="login-form"  data-ng-app="myApp" data-ng-controller="myCtrl">
    <div data-ng-if="spin" class="loader"></div>
        <div class="card">
            <div class="card-header">
                <h1 class="card-title">
                    {{title}}
                </h1>
                <p class="subtitle">{{subtitle}}</p>
            </div>
            <div class="card-body">
                <div class="d-inline-block">
                    <label>Email address  </label>
                    <input data-ng-keyup="keyUp()" data-ng-model="email" name="email" type="text" placeholder="joe@gmail.com" class="form-control" />
                    <br/><span data-ng-if="isUpdated" style="color:green;font-size:14pt">Password sent to your email address. Please check and login with your new password.</span>
                    <br/><span data-ng-if="isError"  style="color:red;font-size:14pt">{{message}}</span>
                </div>
                <div class="d-inline-block">
                    <input data-ng-click="reminder()" type="button" name="name" value="Submit" />
                    <input data-ng-click="back()" type="button" name="name" value="Back" />
                    
                </div>
            </div>
            <div class="card-footer">

                 
            </div>
        </div>
    </div>
    <script src="assets/js/main.js"></script>
    
</body>
</html>
