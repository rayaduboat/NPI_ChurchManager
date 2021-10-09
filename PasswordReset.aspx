<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordReset.aspx.cs" Inherits="PasswordReset" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: black;
        }

        * {
            box-sizing: border-box;
        }

        /* Add padding to containers */
        .container {
            padding: 16px;
            background-color: white;
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* Set a style for the submit button */
        .registerbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

            .registerbtn:hover {
                opacity: 1;
            }

        /* Add a blue text color to links */
        a {
            color: dodgerblue;
        }

        /* Set a grey background color and center the text of the "sign in" section */
        .signin {
            background-color: #f1f1f1;
            text-align: center;
        }
    </style>
</head>
<body>

    <form runat="server">
        <div class="container">
            <h1>Password expired</h1>
            <p>Please fill in this form to change password.</p>
            <hr>
            <label for="email"><b>MemberID</b></label>
            <%--<TextBox id="textboxMemberID" disabled runat="server" type="text" placeholder="Enter Email" name="email" required>--%>
            <asp:TextBox  ID="textboxMemberID" runat="server"></asp:TextBox>
            <label for="email"><b>Email</b></label>
            <%--<TextBox id="textboxEmail" disabled runat="server" type="text" placeholder="Enter Email" name="email" required>--%>
            <asp:TextBox ID="textboxEmail" runat="server"></asp:TextBox>
            <label for="psw"><b>Password</b></label>
            <%--<TextBox id="textboxPassword" runat="server" type="password" placeholder="Enter Password" name="psw" required>--%>
            <asp:TextBox ID="textboxPassword" runat="server" TextMode="Password"></asp:TextBox>
            <label for="psw-repeat"><b>Repeat Password</b></label>
            <%--<TextBox id="textboxConfirmpassword" runat="server" type="password" placeholder="Repeat Password" name="psw-repeat" required>--%>
            <asp:TextBox ID="textboxConfirmpassword" runat="server" TextMode="Password"></asp:TextBox>
            <hr>
            <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
            <asp:Button ID="buttonSubmit" OnClick="buttonSubmit_Click" runat="server" Text="Submit" CssClass="registerbtn" />
            <%--<button type="submit" class="registerbtn">Register</button>--%>
        </div>

        <script>

            //check if user tried to login and was directed here
            var user = sessionStorage.getItem('reset');
            if (typeof user == 'undefined' || user == null) {
                location.assign('Default.aspx');
            } else {
                //parse user information and fill in the user email address
                var parsed = JSON.parse(user);
                document.getElementById("textboxEmail").value = parsed.EmailAddress;
                document.getElementById("textboxMemberID").value = parsed.MemberID;
            }

        </script>
    </form>

</body>
</html>
