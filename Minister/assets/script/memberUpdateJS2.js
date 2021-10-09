
var $rab = $rab || {};
$rab.Company = $rab.Company || {};
$rab.Company.Brand = "AnthonyBobbie Limited ©copyright 2018";
$rab.AuditTrail = $rab.AuditTrail || {};
$rab.Initialise = $rab.Initialise || {};
$rab.GiftAid = $rab.GiftAid || {};
$rab.Login = $rab.Login || {};
$rab.HomePage = "../../default.aspx";
$rab.Utilities = $rab.Utilities || {};
$rab.Report = $rab.Report || {};
$rab.Server = $rab.Server || {};
$rab.Church = $rab.Church || {};
$rab.Membership = $rab.Membership || {};
$rab.Accounts = $rab.Accounts || {};
$rab.Security = $rab.Security || {};
$rab.Security.Church = $rab.Security.Church || {};
$rab.Security.Branch = $rab.Security.Branch || {};
$rab.Utilities = $rab.Utilities || {};
$rab.Church.Minister = "";
$rab.Security.PermissionSet = ["Presbyter", "Administrator", "FinanceAdmin", "FinanceController", "SuperUser"];
$rab.Login.User = "";
$rab.Exception = function (message) { this.message = message; }
$rab.Report.ConventionAndConference = function () {
    this.Submit = function () {
        try {
            // read contents of controls and validate and send data to 
            // database

            var data = new $rab.Report.ConConferenceClass();
            //alert(JSON.stringify(data));
            $.ajax({
                type: 'POST',
                url: 'WeeklyActivities.aspx/PostConventionAndConference',
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    alert(response.d);
                },
                error: function (e) {
                    alert(e.responseText);
                }

            });


        } catch (e) {
            alert(e.message);
        }
    }
}
$rab.Report.ConConferenceClass = function () {
    this.name = $("#textboxEventName").val();
    this.date = $("#textboxDate").val();
    this.speaker = $("#textboxSpeaker").val();
    this.title = $("#textboxTitle").val();
    this.malecount = $("#textboxAdultmalecount").val();
    this.femalecount = $("#textboxfemaleCount").val();
    this.children = $("#textboxchildrenCount").val();
    this.spectacularevent = $("#textboxspectacularEvent").val();
    this.specialOccurence = $("#textboxspecialOccurence").val();
    this.SoulsWon = $("#textboxSoulsWon").val();
    this.convertsWaterBaptised = $("#textboxConvertsWaterBaptised").val();
    this.membersWaterBaptised = $("#textboxMembersWaterBaptised").val();
    this.holySpiritBaptised = $("#textboxHolySpiritBaptised").val();
    this.titheAndOffering = $("#textboxTitheAndOffering").val();
    this.otherOffering = $("#textboxOtherOffering").val();
    this.authorisedExpenditure = $("#textboxAuthorisedExpenditure").val();
    this.generalAssessment = $("#textboxGeneralAssessment").val();
    this.certificationMinister = $("#textboxStartDate").val();
    this.officiatingMMinister = $("#textboxEventEndDate").val();
}
$rab.Configuration = function () {

    try {
        var config = {
            name: $rab.Login.User.Config[0].Value,
            logo: $rab.Login.User.Config[1].Value,
            slogan: $rab.Login.User.Config[2].Value,
            twitter: $rab.Login.User.Config[3].Value,
            facebook: $rab.Login.User.Config[4].Value,
            yahoo: $rab.Login.User.Config[5].Value,
            instagram: $rab.Login.User.Config[6].Value,
            hangout: $rab.Login.User.Config[7].Value,
            caption: $rab.Login.User.Config[8].Value,
            title: $rab.Login.User.Config[9].Value,
            theme: $rab.Login.User.Config[10].Value,
            youtube: $rab.Login.User.Config[11].Value,
            //caption: $rab.Login.User.Config[10].Value,
        }

        //set panel caption
        $("#panel-caption").text(config.caption)
        // set panel title 
        $("#panel-title").text(config.title)
        // set panel theme 
        $("#panel-theme").text(config.theme)
        // set panel church footer name 
        $("#panel-church-name").text('©'+config.name)
        // set panel twitter 
        document.getElementById("panel-church-twitter").href = config.twitter;
        // set panel Facebook 
        document.getElementById("panel-church-facebook").href = config.facebook;
        // set panel youtube ***to be corrected
        document.getElementById("panel-church-youtube").href = config.yahoo;
        // set panel instagram
        document.getElementById("panel-church-instagram").href = config.instagram;
        // set panel panel-church-googleplus
        document.getElementById("panel-church-googleplus").href = config.hangout;
        // set panel logo
        document.getElementById("panel-logo-footer").src = config.logo;
        document.getElementById("panel-logo-header").src = config.logo;
    } catch (e) {
        //alert(e.message);
    }

}

$rab.Login.Credentials = function () {
    this.TempEmailAddress = "temp@piwc.com";
    this.TempPassword = "password123";
    this.Validate = function () {
        try {
            // check entered email address and password
            var isCredentialsValid = false;

            var email = $("#textboxEmail").val();
            var pwd = $("#textboxPassword").val();
            //pass data to server to validate credentials

            //if validation fails and credentials are temporary
            if (!isCredentialsValid && email == this.TempEmailAddress && pwd == this.TempPassword) {
                $("#loginContainer").css("display", "none");
                //enable menu and hide login
                $("#dropdown-menu-2btn-0").css("display", "block");
                //set login credentials to allow pages navigation
                $rab.Login.User = { Email: this.TempEmailAddress, LogInDate: new Date().toLocaleDateString(), LogInTime: new Date().getTime() };
                $("#h2loggeduser").html(this.TempEmailAddress);
                localStorage.setItem("user", JSON.stringify($rab.Login.User));

            }


        } catch (e) {

        }
    }
};
$rab.Initialise.Menus = function () {
    this.Logout = function () {
        try {
            //wire logout control
            //remove local storage
            localStorage.removeItem("user");
            //location.assign($rab.HomePage);

        } catch (e) {

        }
    }

};
$rab.Membership.GetMembers = function (branchName) {
    try {
        if (branchName.trim().length == 0 || branchName == "Please select branch")
            throw new $rab.Exception("Please select a branch name")
        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetMembers',
            data: JSON.stringify({ branchName: branchName }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var message = "Invalid credentials or member not known";
                new $rab.Membership.Table(data.d).Build();//build the table
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    } catch (e) {
       // alert(e.message);
    }
}
$rab.Membership.GetMembersList = function (branchName, handler) {
    try {
        if (branchName.trim().length == 0 || branchName == "Please select branch") throw new $rab.Exception("Please select a branch name")
        if (typeof handler !== "function") throw new $rab.Exception("invalid function handle passed")

        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetMembers',
            data: JSON.stringify({ branchName: branchName }),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var message = "Invalid credentials or member not known";
                handler(data.d);//build the table
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    } catch (e) {
        //alert(e.message);
    }
}
$rab.Membership.Table = function (jsondata) {

    this.Build = function () {
        try {
            var members = JSON.parse(jsondata);
            //alert(JSON.stringify(jsondata));
            $("#tbodyMembers").empty();
            var table = document.getElementById("tbodyMembers");
            for (var i = 0; i < members.length; i++) {
                // add member records 
                var tr = document.createElement("tr");
                var tdFirstName = document.createElement("td"); tdFirstName.className = "body-item mbr-fonts-style display-7"; tdFirstName.innerHTML = members[i].FirstName;
                var tdLastName = document.createElement("td"); tdLastName.className = "body-item mbr-fonts-style display-7"; tdLastName.innerHTML = members[i].LastName;
                var tdTelephone = document.createElement("td"); tdTelephone.className = "body-item mbr-fonts-style display-7"; tdTelephone.innerHTML = members[i].Telephone;
                var tdEmail = document.createElement("td"); tdEmail.className = "body-item mbr-fonts-style display-7"; tdEmail.innerHTML = members[i].Email;
                var tdMembershipType = document.createElement("td"); tdMembershipType.className = "body-item mbr-fonts-style display-7"; tdMembershipType.innerHTML = members[i].MembershipType;
                var tdEdit = document.createElement("td"); tdEdit.className = "body-item mbr-fonts-style display-7";//
                var button = document.createElement("span"); button.innerHTML = "Edit";
                button.Record = members[i];
                button.onclick = function () {
                    document.getElementById("memberID").value = this.Record.MemberID;
                    document.getElementById("textboxFirstName").value = this.Record.FirstName;
                    document.getElementById("textboxLastName").value = this.Record.LastName;
                    document.getElementById("textboxTelephone").value = this.Record.Telephone;
                    document.getElementById("textboxEmail").value = this.Record.Email;
                    document.getElementById("selectMemType").value = this.Record.MembershipType == 'Non' ? 'Non-Member' : 'Member';
                    document.getElementById("buttonDialog").click();
                }


                //var spanEmail = document.createElement("i");// spanEmail.innerText="email"// button.type = "button"; button.value = "Send email";
                //spanEmail.MemberRecord = members[i];
                //spanEmail.onclick = function () {
                //    //$("#textareaEmailComment").empty()
                //    //document.getElementById("buttonSendEmailModal").click();
                //    //document.getElementById("textboxEmail").value = this.MemberRecord.Email;

                //}
                button.className = "form-control";
                //spanEmail.className = "fa fa-envelope fa-lg";

                tdEdit.appendChild(button);
                //tdEdit.appendChild(spanEmail);
                tr.appendChild(tdFirstName);
                tr.appendChild(tdLastName);
                tr.appendChild(tdTelephone);
                tr.appendChild(tdEmail);
                tr.appendChild(tdMembershipType);
                tr.appendChild(tdEdit);
                table.appendChild(tr);
            }

        } catch (e) {
            alert(e.message);
        }
    }
    this.Update = function () {
        // alert("got here okay");
        try {
            var url = "MembershipList.aspx/UpdateMemberDetails"
            var obj = { memberID: document.getElementById("memberID").value, firstName: $("#textboxFirstName").val(), lastName: $("#textboxLastName").val(), telephone: $("#textboxTelephone").val(), email: $("#textboxEmail").val(), membershipType: $("#selectMemType").val() }
            var handler = function (serverdata) {
                if (serverdata == 'Failed updating data') {
                    alert('failed updating date');
                } else if (serverdata == 'update successful') {
                    alert('Update successful');
                    // reload 

                    $("#closeButton").click();
                    $("#buttonSearch").click();
                    //location.reload();
                }
            };
            new $rab.Server.Method().BeginInvoke(url, obj, handler);
        } catch (e) {

        }
    };
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
$rab.Church.LoadBranches = function (dropdown) {
    //loads church branches into dropdown control supplied
    try {
        var url, obj, handler;
        url = "Events.aspx/LoadBranches";
        obj = {};
        handler = function (jsonData) {
            try {


                if (jsonData == "failed getting branches") throw new $rab.Exception(jsonData);
                var parsed = JSON.parse(jsonData);
                for (var i = 0; i < parsed.length; i++) {
                    var option = document.createElement("option");
                    option.value = parsed[i].BranchName;
                    option.text = parsed[i].BranchName;
                    option.innerHTML = parsed[i].BranchName;
                    option.BranchID = parsed[i].BranchID;
                    document.getElementById(dropdown).appendChild(option);
                }
            } catch (e) {

            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
}
$rab.Church.GetAllBranches = function (func) {
    //loads church branches into dropdown control supplied
    //func handler handler to passed read branches
    var branches = "";
    try {
        var url, obj, handler;
        url = "Events.aspx/LoadBranches";
        obj = {};
        handler = function (jsonData) {
            try {


                if (jsonData == "failed getting branches") throw new $rab.Exception(jsonData);
                branches = JSON.parse(jsonData);
                func(branches);

            } catch (e) {

            }
        }
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
    } catch (e) {

    }
    return branches;
}
$rab.Security.Church.LoadBranches = function (branchName) {
    try {
        var user = JSON.parse(localStorage.getItem("user"));
        //CHECK IF USER IS A SUPER USER AND ALLOW USER TO SELECT ALL BRANCH NAMES
        //ELSE RESTRICT USER TO THEIR LOCAL
        if (user.LoginType == "SuperUser" || user.LoginType == "FinanceController") {
            //load all branch names
            $rab.Church.LoadBranches(branchName)
            //$rab.Branch.Events.LoadEvents(user.BranchName);
        } else {
            $("#" + branchName).empty();
            var option = document.createElement("option");
            option.value = user.BranchName; option.innerHTML = user.BranchName;
            option.BranchID = user.BranchId
            document.getElementById(branchName).appendChild(option);
        }
    } catch (e) {
        alert(e.message);
    }
}
$rab.Security.LockDown = function () {
    this.LoginType = JSON.parse(localStorage.getItem("user")).LoginType;
    this.AccountMenu = function () {
        try {
            if (this.LoginType == "SuperUser") {
                //do nothing
            } else {
                $("a[href='Accounts.aspx']").hide();
            }
        } catch (e) {

        }
    }
    this.FinanceMenu = function () {
        //try {
        //    if (["FinanceAdmin","FinanceController","SuperUser"].indexOf(this.LoginType) != -1) {
        //        //do nothing
        //    } else {
        //        $("a[href='Finances.aspx']").hide();
        //    }
        //} catch (e) {

        //}
    }
    this.DisplayLoggedInUser = function () {
        $("#aloginUser").html("Welcome " + $rab.Login.User.FirstName + " " + $rab.Login.User.LastName);
    }
    this.PagePermission = function (checkPermission) {
        if ($rab.Login.User.LoginType != "SuperUser") {
            //do nothing
            if (typeof $rab.Login.User.Permissionset == 'object') {
                // user has more than one permission
                var matchfound = false
                for (var i = 0; i < $rab.Login.User.Permissionset.length; i++) {
                    if (checkPermission.indexOf($rab.Login.User.Permissionset[i]) > -1) {
                        matchfound = true;
                        break;
                    }
                }
                if (!matchfound) location.assign("ManagementList.aspx");
            }
        }
    }
    this.HideMenuDropdowns = function () {
        try {

            if ($rab.Login.User.LoginType == 'SuperUser') return false;
            // check if user has accounts permission and hide menu 
            // if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Accounts' }).length==0) $("a[href='Accounts.aspx']").hide();
            // check if user has attendance permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Attendance' }).length == 0) $("a[href='Attendance.aspx']").hide();
            //// check if user has census permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Census' }).length == 0) $("a[href='BranchCensus.aspx']").hide();
            //// check if user has events permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Events' }).length == 0) $("a[href='Events.aspx']").hide();
            //// check if user has finance permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Finances' }).length == 0) $("a[href='Finances.aspx']").hide();
            //// check if user has followup permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Follow-up' }).length == 0) $("a[href='Followup.aspx']").hide();
            //// check if user has membershiplist permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Membership List' }).length == 0) $("a[href='MembershipList.aspx']").hide();
            //// check if user has monthly planner permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Monthly planner' }).length == 0) $("a[href='MonthlyPlanner.aspx']").hide();
            //// check if user has preaching plan permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Preaching plan' }).length == 0) $("a[href='Preaching plan.aspx']").hide();
            //// check if user has weekly service report permission and hide menu
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Weekly service report' }).length == 0) $("a[href='WeeklyServiceReport.aspx']").hide();
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Baptism' }).length == 0) $("a[href='Baptism.aspx']").hide();
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Custom Reports' }).length == 0) $("a[href='Custom.aspx']").hide();
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Standard Reports' }).length == 0) $("a[href='Standard.aspx']").hide();

            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Gift Aid' }).length == 0) $("a[href='Giving.aspx']").hide();
            if ($rab.Login.User.Permissionset.filter(function (val) { return val == 'Appointment' }).length == 0) $("a[href='Appointment.aspx']").hide();


        } catch (e) {
            alert(e.message);
        }
    }
}
$rab.Server.Dispatcher = function () {
    this.url = "";
    this.obj = "";
    this.handler = ""
    this.invoke = function () {
        new $rab.Server.Method().BeginInvoke(this.url, this.obj, this.handler)
    }
}
$rab.Utilities.FillOptions = function (filter, element) {
    //filter: array of strings
    //element: select element to populate
    if (filter === null) return false;
    var array = [];
    for (var i = 0; i < filter.length; i++) {
        var option = document.createElement("option");
        if (array.indexOf(filter[i]) == -1) {
            option.value = filter[i];
            option.innerHTML = filter[i];
            document.getElementById(element).appendChild(option);
            array.push(filter[i]);
        }
    }

};
$rab.AuditTrail = function () {
    this.PageVisited = function (page) {
        try {
            var date = new Date();
            obj = {
                memid: $rab.Login.User.MemberID,
                brnchid: $rab.Login.User.BranchID,

                pagevisited: page
            };
            new $rab.Server.Method().BeginInvoke("Accounts.aspx/AddAudit", obj, function (jsondata) {
                // string memid, string brnchid, string datevisited, string timevisited, string pagevisited
                try {

                } catch (e) {

                }
            });
        } catch (e) {

        }
    }
    this.GetAuditTrail = function () {

    }
}
$rab.Export = function (data) {
    this.ToExcel = function () {
        try {
            var excelApp = new ActiveXObject("Excel.Application");
            var excelWb = excelApp.Workbooks.Add();
            var excelWs = excelWb.Worksheets.Add();
            excelApp.Visible = true;
        } catch (e) {
            alert(e.message);
        }
    }
    this.ToWord = function () {

    }
    this.ToPDF = function () {

    }
}
$rab.Branch = function () {
    this.BranchInfo = {
        BranchName: $("#selectBranchNames").val(),
        BranchID: document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID
    }
}
$rab.CreateTable = function (columns) {
    var table = document.createElement("table");
    table.className='table table-hover table-responsive'
    var tr = document.createElement("tr");

    var thead = document.createElement("thead");
    var tbody = document.createElement("tbody");
    tbody.id = "tablebodyexport";
    table.id = 'tableexport'

    try {
        if (columns == null || columns.length == 0) return false;
        for (var i = 0; i < columns.length; i++) {
            //create table column
            var td = document.createElement("td");
            td.innerHTML = columns[i];
            tr.appendChild(td);
        }
        thead.appendChild(tr);

        table.appendChild(thead);
        table.appendChild(tbody);

    } catch (e) {

    }
    return { table: table, tbody: tbody,thead:thead };
}
$rab.Dictionary = function () {
    this.Create = function (name, value, callhandler) {
        //name: of dictionary item
        //value: value of dictionary item
        try {
            //validate arguments
            if (name == null || name.trim().length == 0) throw new $rab.Exception('Invalid dictionary name passed');
            if (value == null || value.trim().length == 0) throw new $rab.Exception('Invalid value  passed');
            if (typeof callhandler !== 'function') throw new $rab.Exception('Invalid function handle  passed');

            var url, obj, handler;
            url = 'Accounts.aspx/CreateDictionary';
            obj = { namee: name };
            handler = function (jsondata) {
                try {
                    if (jsondata == 'failed getting dictionary values') throw new $rab.Exception(jsondata);
                    if (typeof jsondata == 'object') {
                        var parsed = JSON.parse(jsondata);
                        callhandler(jsondata);
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler);


        } catch (e) {
            alert(e.message);
        } 
    }
    this.GetValues = function (name,callhandler) {
        //name of dictionary to get
        //function to handle dictionary values returned from the server
        try {
            //validate arguments
            if (name == null || name.trim().length == 0)   throw new $rab.Exception('Invalid dictionary name passed');
            if (typeof callhandler !== 'function') throw new $rab.Exception('Invalid function handle  passed');
            var url, obj, handler;
            url = 'Accounts.aspx/GetDictionaryValues';
            obj = { namee: name };
            handler = function (jsondata) {
                try {
                    if (jsondata == 'failed getting dictionary values') throw new $rab.Exception(jsondata);
                    if (typeof jsondata == 'object') {
                        var parsed = JSON.parse(jsondata);
                        callhandler(jsondata);
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
            new $rab.Server.Method().BeginInvoke(url,obj,handler);


        } catch (e) {
            alert(e.message);
        } 
    }
}
$rab.Utilities.Common = function () {
    this.yyyymmdd = function (date) {
        //change a date in the form yyyy/mm/dd to yyyymmdd
        if (date == null || typeof date != "string" || date.length != 10) {
            alert("cant convert " + date + " to yyyymmdd"); return;
        }
        var yyyy = date.split("/")[2];
        var mm = date  .split("/")[1];
        var dd = date  .split("/")[0];
        return yyyy + mm + dd;
    }
    this.UKdate = function (date) {
        //change a date in the form yyyymmdd to yyyy/mm/dd
        if (date.length != 8) {
            alert("cant convert " + date + " to dd/mm/yyyy"); return;
        }
        var yyyy = date.substring(0,4);
        var mm = date.substring(4, 6);
        var dd = date.substring(6, 8);
        return dd+"/"+mm+"/"+yyyy;
    }
    

}