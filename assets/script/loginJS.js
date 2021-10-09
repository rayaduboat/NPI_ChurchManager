
var $rab = $rab || {};
$rab.Server = $rab.Server || {};
$rab.isValidEmail = false;
$rab.PagePasswordReset = "PasswordReset.aspx";
sessionStorage.setItem("attempts", 0);//user can attempt three times to enter a valid email address and then he will thrown off
sessionStorage.setItem("passwordattempts", 0);
$rab.Login = function () {

    this.Validate = function () {
        var email = $('#textboxUserName').val();
        var pwd = $('#textboxPassword').val();

        var inv = new $rab.Server.Dispatcher();
        if (!$rab.isValidEmail) {
            inv.obj = { email: email };
            inv.url = "Default.aspx/IsValidEmail";
            inv.handler = this.ValidateEmail;
            if (email.length == 0) return;
        } else {
            if (email.length == 0 || pwd.length == 0) return;
            inv.obj = { email: email, pwd: pwd };
            inv.url = "Default.aspx/ValidateCredentials";
            inv.handler = this.ValidateCredentials;
        }
        inv.invoke();

    }
    this.ValidateEmail = function (res) {
        if (res == "true") {
            $rab.isValidEmail = true;
            //display password box
            $('#passwordBox').show();
            $('#emailBox').hide();
        } else {
            alert('unknown email address');
            if (sessionStorage.getItem('attempts') < 3) sessionStorage.setItem("attempts", (parseInt(sessionStorage.getItem('attempts')) + 1).toString());
            if (sessionStorage.getItem('attempts') == 3) {

                $('#passwordBox,#passwordbutton,#emailBox').hide();
                $('#loginFailure').show();
                //too many email guesses, your session has now been cancelled

            };

        }
    }
    this.ValidateCredentials = function (data) {
        try {
            //var message = "Invalid credentials or member not known";
            if (typeof data == 'undefined') { alert(data); return; }
            if (data == "Invalid credentials or member not known") {
                alert(data);
                // allow three attempts and stop session
                if (sessionStorage.getItem('passwordattempts') < 3) sessionStorage.setItem("passwordattempts", (parseInt(sessionStorage.getItem('passwordattempts')) + 1).toString());
                if (sessionStorage.getItem('passwordattempts') == 3) {

                    $('#passwordBox,#passwordbutton,#emailBox').hide();
                    $('#loginFailure').show();
                    //too many email guesses, your session has now been cancelled

                };

                return;
            }
            var parse = JSON.parse(data);
            if (parse.LoginSuccessful == "successfully logged in") new $rab.Login().ResetPassword(parse) 
        } catch (e) {
            // alert(e.message);
        }
    }
    this.ResetPassword = function (parse) {
        try {
            sessionStorage.setItem('reset', JSON.stringify(parse));
            //check if password date and todays date >90
            if (typeof parse == 'undefined') { location.assign($rab.PagePasswordReset); return; }// no password date set navigate user to password update page
            if (typeof parse.PasswordDate == 'undefined' ||
                parse.PasswordDate == 0 ||
                parse.PasswordDate == null) {
                location.assign($rab.PagePasswordReset); return;
            }
            var todaydateInt = new Date().toISOString().slice(0, 10).replace(/-/g, "");
            var passwordDateInt = parse.PasswordDate;
            //reset days to be set by administrator
            var days = new $rab.Login().getPassWordExpiryDate();
            //default password expiry
            if (days == null|| typeof days=='undefined') days = 90;
            if (todaydateInt - passwordDateInt >= days ) {
                location.assign($rab.PagePasswordReset);
                return;
            }
            //User is good and set to go
            localStorage.setItem('user', JSON.stringify(parse));
            location.assign('Minister/ManagementList.aspx');
        }
        catch (e) {

        }
    }
    this.getPassWordExpiryDate=  function () {
       var returnValue = null;
       try {
           var items = JSON.parse(localStorage.getItem('user')).Config;
           if (items == null) return;
           //find item with name PasswordExpiry
           var result = items.filter(function (value, index) { return value.Name == 'PasswordExpiry' });
           if (result.length != 0)
               returnValue = result[0].Value;


       } catch (e) {

       }
       return returnValue;
    } 
}
$rab.Server.Method = function () {
    this.BeginInvoke = function (url, obj, handler) {
        //url: webpage where webmethod lives
        //obj: object to pass to server method as a parameter
        //handler: method to invoke after successful return
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                // Do something interesting here.
                handler(msg.d);

            },
            error: function (e) {
                alert(e.responseText);
            }
        });
    }
    this.BeginInvokeAll = function (url, obj, handlers) {
        //url: webpage where webmethod lives
        //obj: object to pass to server method as a parameter
        //handlers: methods to invoke after successful return
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                // Invoke all the methods passed.
                for (var i = 0; i < handlers.length; i++) {
                    handler(i)();
                }


            },
            error: function (e) {
                alert(e.responseText);
            }
        });
    }
}
$rab.Server.Dispatcher = function (url,obj,handler) {
    this.url = url;
    this.obj = obj;
    this.handler = handler;
    this.invoke = function () {
        new $rab.Server.Method().BeginInvoke(this.url, this.obj, this.handler)
    }
    
}


