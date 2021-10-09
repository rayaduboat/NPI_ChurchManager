<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="Minister_Configuration" %>

<!DOCTYPE html>
<html>
<head>
    <title>Configuration settings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        label {
            padding: 12px 12px 12px 0;
            display: inline-block;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

            input[type=submit]:hover {
                background-color: #45a049;
            }

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        .col-25 {
            float: left;
            width: 15%;
            margin-top: 6px;
        }

        .col-75 {
            float: left;
            width: 75%;
            margin-top: 6px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .btn {
            border: 40px;
            padding: 20px !important;
            width: 100px !important;
            background-color: #293955!important;
            color: white;
            float:left!important;
        }
        /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
        @media (max-width: 600px) {
            .col-25, .col-75, input[type=submit] {
                width: 100%;
                margin-top: 0;
            }
        }
    </style>
</head>
<body>


    <div class="container">

        <div style="background-color: #293955; color: white; font-weight: 600; padding: 20px;">
            <h1>Create Application configuration </h1>
        </div>
        <h2>First time setup operation</h2>

        <form runat="server">
             

            <div class="row">
                <div class="col-25">
                    <label for="fname">Name	 </label>
                </div>
                <div class="col-75">
                    <%--<input type="text" id="textboxName" runat="server"  placeholder="Your name..">--%>
                    <asp:TextBox ID="textboxName" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname" style="visibility: hidden">Logo</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxLogo" runat="server"  placeholder="Your Logo.." visible="False">
                    <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Slogan</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxSlogan" runat="server"  placeholder="Your Slogan..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Twitter</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxTwitter" runat="server"  placeholder="Your Twitter..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Facebook</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxFacebook" runat="server"  placeholder="Your Facebook..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Yahoo</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxYahoo" runat="server"  placeholder="Your Yahoo..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Youtube</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxYoutube" runat="server"  placeholder="Your Logo..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Instagram</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxInstagram" runat="server"  placeholder="Your Instagram..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Hangout</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxHangout" runat="server"  placeholder="Your Hangout..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">PanelCaption</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxPanelCaption" runat="server"  placeholder="Your Panel Caption..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">PanelTitle</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxPanelTitle" runat="server"  placeholder="Your Panel Title..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Theme</label>
                </div>
                <div class="col-75">
                    <input type="text" id="textboxPanelTheme" runat="server"  placeholder="Your Theme..">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="fname"></label>
                </div>
                <div class="col-75 " style="text-align: left;">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn" OnClick="buttonSaveConfiguration_Click" />
                    <%--                    <input type="button"   onclick="{ new $config.NewClient().Configuration();}" value="Submit" style="border:40px;padding:20px!important;width:100px!important; background-color:#293955;color:white;">--%>
                </div>
            </div>

            <div>

                <script src="assets/web/assets/jquery/jquery.min.js"></script>

                <script src="assets/script/AccessJS.js"></script>
                <script src="assets/popper/popper.min.js"></script>
                <script src="assets/tether/tether.min.js"></script>
                <script src="assets/bootstrap/js/bootstrap.min.js"></script>
                <script src="assets/smooth-scroll/smooth-scroll.js"></script>

                <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
                <script src="assets/data-tables/jquery.data-tables.min.js"></script>
                <script src="assets/data-tables/data-tables.bootstrap4.min.js"></script>

                <script src="assets/script/AccessJS.js"></script>
                <script src="assets/script/ConfigurationJS.js"></script>
            </div>
        </form>
    </div>

</body>
</html>

