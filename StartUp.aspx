<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StartUp.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rabant solutions limited</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body, html {
            height: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            margin: 0px;
            padding: 0px;
        }
        .big{
            padding:20px;
            width:100px;
        }
        .bg-img {
            /* The image used */
            background-image: url("Minister/assets/images/mbr-1620x1080.jpg");
            min-height: 100%;
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        /* Add styles to the form container */
        .container {
            position: absolute;
            top: 10%;
            left: 40%;
            margin: 20px;
            max-width: 500px;
            padding: 16px;
            background-color: white;
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 90%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

        /* Set a style for the submit button */
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 90%;
            opacity: 0.9;
        }

            .btn:hover {
                opacity: 1;
            }
    </style>
    <style>
       
        @media only screen and (max-width : 480) {
            .container {
                position: absolute;
                top: 10%;
                left: 10%;
                margin: 20px;
                max-width: 500px;
                padding: 16px;
                background-color: white;
            }
        }

        @media only screen and (max-width : 320px) {
            .container {
                position: absolute;
                top: 10%;
                left: 10%;
                margin: 20px;
                max-width: 500px;
                padding: 16px;
                background-color: white;
            }
        }
    
        
        </style>
</head>
<body>


    <div class="bg-img">
        <form runat="server">
            <div class="container">
                <h2 >AnthonyBobbie Limited</h2>
                <hr />
                <br />
                <label for="email"><b>Email</b></label>
                <asp:TextBox ID="TextBoxEmail"  runat="server" Font-Size="X-Large"></asp:TextBox>

                <label for="email"><b>Password</b></label>
                <asp:TextBox ID="TextBoxPassword" runat="server" Text="" TextMode="Password"></asp:TextBox>
                
                <asp:Button ID="ButtonPassword" Font-Size="12" CssClass="big" runat="server" Text="Button" OnClick="ButtonPassword_Click" />
               
            </div>
        </form>
    </div>


</body>
</html>

