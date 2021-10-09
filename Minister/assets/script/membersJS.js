$rab.Membership.Permissionset = ["All", "SuperUser", "Membership List"];
$rab.Membership.Temp = []; $rab.MembershipTitles = [];
$rab.Membership.DistrictAreaGrouping = [];//stores area and district names used in transfers
$rab.TempMemberBeingTransfered = "";//Holds member details of person being transferred as displayed in GUI
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
        alert(e.message);
    }
}
$rab.Membership.GetMembersV2 = function () {
    try {
        var selectBranchName = $("#selectBranchNames");
        var selectMembershipType = $("#selectViewMembershipType")

        $("#tbodyMembers").empty();
        $("#tbodycellgroups").empty();
        if (selectBranchName.val() != "Please select branch" && selectMembershipType.val() != null && selectMembershipType.val().toString().trim().length != 0) {
            var obj = {
                branchID: new $rab.Branch().BranchInfo.BranchID,
                memtype: selectMembershipType.val(),
                branchName: selectBranchNames.value
            }
            var url = "MembershipList.aspx/GetMembersByMembershipType"
            new $rab.Server.Method().BeginInvoke(url,
                obj,
                function (jsondata) {
                    try {

                        new $rab.Membership.Table(jsondata).Build();
                        //new $rab.Membership.Filters().Refresh();
                    } catch (e) {

                    }

                });
        }
        else {
            //if validation fails return silently
            return;
        }
    } catch (e) {

    }
}
$rab.Membership.GetNonMembers = function (branchName) {
    try {
        if (branchName.trim().length == 0 || branchName == "Please select branch")
            throw new $rab.Exception("Please select a branch name")
        $.ajax({
            type: "POST",
            url: 'MembershipList.aspx/GetNonMembers',
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
        alert(e.message);
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
        alert(e.message);
    }
}
$rab.Membership.UpdateNewMember = function () {
    // alert("got here okay");
    try {
        var url = "MembershipList.aspx/UpdateAllMemberDetails"
        obj = {
            memberID: document.getElementById("buttonSubmitUpdateMember").MemberID,
            title: $("#selectNewMemberTitle").val(),
            branchName: $("#selectBranchNames").val(),
            FirstName: $("#textboxNewMemberFirstName").val(),
            LastName: $("#textboxNewMemberLastName").val(),
            Address1: $("#textboxNewMemberAddressLineone").val(),
            Address2: $("#textboxNewMemberAddressLinetwo").val(),
            PostCode: $("#textboxNewMemberPostcode").val(),
            Town: $("#textboxNewMemberTown").val(),
            Email: $("#textboxNewMemberEmail").val(),
            DOB: $("#textboxNewMemberDOB").val(),
            Country: $("#selectNewMemberCountry").val(),
            Status: $("#selectMembershipType").val(),
            Telephone: $("#textboxNewMemberTelephone").val(),
            AgeCategory: $("#selectNewMemberAgeCategory").val(),
            Comment: $("#textboxNewMemberComment").val(),
            Gender: $("#selectNewMemberGender").val(),
            Nationality: $("#textboxNationality").val(),
            MaritalStatus: $("#textboxMaritalStatus").val(),
            Profession: $("#textboxProfession").val(),
            Ethnicity: $("#ethnicity").val(),
        };

        //if (obj.title == "Select title") throw new $rab.Exception("Select title");
        //if (obj.AgeCategory == "Select age category" || obj.AgeCategory == null) throw new $rab.Exception("Select age category");
        //if (obj.branchName == "Select branch" || obj.branchName == null) throw new $rab.Exception("Select branch");
        //if (obj.Gender == "Select gender" || obj.Gender == null) throw new $rab.Exception("Select gender");
        //if (obj.Status == "Select type of membership" || obj.Status == null) throw new $rab.Exception("Select type of membership");
        //if (obj.Country == "Select country" || obj.Country == null) throw new $rab.Exception("Select country");
        //if (obj.FirstName.trim().length == 0) throw new $rab.Exception("Please enter first name");
        //if (obj.LastName.trim().length == 0) throw new $rab.Exception("Please enter last name");
        //if (obj.Nationality == "Select country" || obj.Nationality == null) throw new $rab.Exception("Select country of nationality");
        //if (obj.MaritalStatus == "Select marital status" || obj.MaritalStatus == null) throw new $rab.Exception("Select marital status");

        var handler = function (serverdata) {
            if (serverdata == 'Updadting member record failed miserably' || serverdata == "email address already taken") {
                alert('failed updating date');
            } else if (serverdata == 'updating member record was successful') {
                alert('Update successful');
                // reload 
                $rab.Membership.GetMembers(obj.branchName);
                //$(".modal-dialog-1 input[type=text],.modal-dialog-1 select").val("");
                $("#buttonCloseNewMember").click();
                //$("#buttonSearch").click();
                //location.reload();
            }
        };
        new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Membership.Table = function (jsondata) {
    this.ColumnFilter = function () {
        try {
            var members = JSON.parse(jsondata);
        } catch (e) {

        }
    }
    this.Build = function () {
        try {
            $("#tbodyMembers").empty();
            if (jsondata == "failed getting membership list ") {
                //alert(jsondata);
                return
            }

            var members = JSON.parse(jsondata);
            if (members.length == 0) {
                alert("Oops no members found"); return
            }
            $("#tbodyMembers,#selectRelationMember").empty();
            new $rab.Membership.Table(members);
            $rab.Membership.Temp = members;
            new $rab.Membership.Relatives(members).Build();
            new $rab.Membership.Relatives().LoadMemberRelativesNames();
            var table = document.getElementById("tbodyMembers");
            var tbody = document.getElementById("tbodyMembers");
            //get columns selected from user
            var columns = new $rab.Membership.Columns().GetColumns();
            //create column headers for user
            //add column data
            if (columns == null || columns.length == 0) {
                new $rab.Membership.Table().BuildDefault(members);
            } else {
                new $rab.Membership.Table().BuildSelected(members);
            }

        } catch (e) {
            //alert(e.message);
        }
    }
    this.BuildDefault = function (members) {
        //creates a default table if no
        //columns are selected
        var offset = 0;
        var tbody = document.getElementById("tbodyMembers");
        this.BuildManagementOptions();
        for (var i = 0; i < members.length; i++) {

            tbody.rows[i].insertCell(offset + 1).innerHTML = members[i].MemberID;
            tbody.rows[i].insertCell(offset + 2).innerHTML = members[i].LastName;;
            tbody.rows[i].insertCell(offset + 3).innerHTML = members[i].FirstName;;
            tbody.rows[i].insertCell(offset + 4).innerHTML = members[i].Gender;;
            tbody.rows[i].insertCell(offset + 5).innerHTML = members[i].Telephone;;
            tbody.rows[i].insertCell(offset + 6).innerHTML = members[i].Email;;
            tbody.rows[i].insertCell(offset + 7).innerHTML = this.ProperAgeCategorisation(members[i].AgeCategory);
            tbody.rows[i].insertCell(offset + 8).innerHTML = members[i].AgeCategory;
            this.TableRowSelection(tbody.rows[i], members[i]);//allow row to be selected
        }

    }
    this.TableRowSelection = function (tr, data) {
        tr.data = data;
        tr.onclick = function () {
            var trs = $("#tbodyMembers tr");
            for (var i = 0; i < trs.length; i++) {
                trs.children('td').css('background-color', '');
                trs[i].selected = false;
            }
            for (var i = 0; i < this.children.length; i++) {
                this.children[i].style.backgroundColor = "red";
            }

            this.selected = true;
        }
    }

    this.BuildSelected = function () {
        try {
            //displays selected table columns and headers
            var members = $rab.Membership.Temp;
            //build column header first four for management
            //remaining columns to add to columns
            var tbody = document.getElementById("tbodyMembers");
            var trheader = document.getElementById('trheader');
            $(trheader).empty();
            $(tbody).empty();

            var columns = new $rab.Membership.Columns().GetColumns();
            for (var i = 0; i < 1; i++) {

                trheader.insertCell(0).innerHTML = "Action"
                trheader.cells[0].style.color = "red";
                trheader.cells[0].fontweight = "bold";
                trheader.cells[0].className = "head-item mbr-fonts-style display-7";
            }
            for (var i = 0; i < columns.length; i++) {

                trheader.insertCell(i + 1).innerHTML = columns[i];
                trheader.cells[i + 1].className = "head-item mbr-fonts-style display-7";
                trheader.cells[i + 1].fontweight = "bold";
            }
            this.BuildManagementOptions();

            //build management options
            //for each member
            var columnsOffset = 1;
            for (var i = 0; i < members.length; i++) {
                //for each column header of data
                for (var j = 0; j < columns.length; j++) {
                    try {
                        //offset 4 rows for  management columns
                        tbody.rows[i].insertCell(j + columnsOffset).innerHTML = members[i][columns[j].trim()]
                        this.TableRowSelection(tbody.rows[i], members[i]);//allow row to be selected

                    } catch (e) {

                    }
                }
            }

        } catch (e) {

        }


    }
    this.BuildManagementOptions = function () {
        var members = $rab.Membership.Temp;
        //build column header first four for management
        //remaining columns to add to columns
        var tbody = document.getElementById("tbodyMembers");
        var trheader = document.getElementById('trheader');

        for (var i = 0; i < members.length; i++) {
            //add names to member relation dropdown menu
            // add entries to relation table to build dynamically as well
            // add member records 
            //var tr = document.createElement("tr");
            var tr = tbody.insertRow(i);

            //var tdEdit = tbody.rows[i].insertCell(0);
            //var tdGroups = tbody.rows[i].insertCell(1);
            //var tdtransfer = tbody.rows[i].insertCell(2);
            var tdIndex = tbody.rows[i].insertCell(0);



            var buttonUpdate = document.createElement("button"); buttonUpdate.innerHTML = "update";
            var buttonFollowuup = document.createElement("button"); buttonFollowuup.innerHTML = "family";
            var buttonGroups = document.createElement("button"); buttonGroups.innerHTML = "groups";
            var btnTransfer = document.createElement("button"); btnTransfer.innerHTML = "transfer";
            buttonUpdate.style.margin = '10px'; buttonUpdate.style.padding = '5px';
            buttonFollowuup.style.margin = '10px'; buttonFollowuup.style.padding = '5px';
            buttonGroups.style.margin = '10px'; buttonGroups.style.padding = '5px';
            btnTransfer.style.margin = '10px'; btnTransfer.style.padding = '5px';
            //buttonUpdate.className = "img img-thumbnail img-responsive";     //buttonUpdate.src          = "assets/images/update1.png";    
            //buttonFollowuup.className = "img img-thumbnail img-responsive";  //buttonFollowuup.src = "assets/images/family.png";     
            //buttonGroups.className = "img img-thumbnail img-responsive";     //buttonGroups.src    = "assets/images/groups.png";     
            //btnTransfer.className = "img img-thumbnail img-responsive";     //btnTransfer.src     = "assets/images/transfer.png";   

            buttonUpdate.title = "Click to Update details";
            buttonFollowuup.title = "Click to view member relatives";
            buttonGroups.title = "Click to view member Cell groups";
            btnTransfer.title = "Click to view and transfer member";

            btnTransfer.Record = members[i];
            buttonGroups.Record = members[i];
            buttonUpdate.Record = members[i];
            buttonFollowuup.Record = members[i];

            buttonUpdate.onclick = function () {
                $("#selectNewMemberTitle").val(this.Record.Title == null ? "" : this.Record.Title.trim()),
                    $("#textboxProfession").val(this.Record.Profession == null ? "" : this.Record.Profession),
                    $("#textboxNewMemberFirstName").val(this.Record.FirstName == null ? "" : this.Record.FirstName),
                    $("#textboxNewMemberLastName").val(this.Record.LastName == null ? "" : this.Record.LastName),
                    $("#textboxNewMemberAddressLineone").val(this.Record.AddressLineone == null ? "" : this.Record.AddressLineone),
                    $("#textboxNewMemberAddressLinetwo").val(this.Record.AddressLinetwo == null ? "" : this.Record.AddressLinetwo),
                    $("#textboxNewMemberPostcode").val(this.Record.Postcode == null ? "" : this.Record.Postcode),
                    $("#textboxNewMemberTown").val(this.Record.Town == null ? "" : this.Record.Town),
                    $("#textboxNewMemberEmail").val(this.Record.Email == null ? "" : this.Record.Email),
                    $("#textboxNewMemberDOB").val(this.Record.DOB == null ? "" : this.Record.DOB),
                    $("#selectNewMemberCountry").val(this.Record.Country == null ? "" : this.Record.Country),
                    $("#textboxNewMemberTelephone").val(this.Record.Telephone == null ? "" : this.Record.Telephone),
                    $("#selectNewMemberAgeCategory").val(this.Record.AgeCategory == null ? "" : this.Record.AgeCategory),
                    $("#textboxNewMemberComment").val(this.Record.Comment == null ? "" : this.Record.Comment),
                    $("#selectNewMemberGender").val(this.Record.Gender == null ? "" : this.Record.Gender.trim()),
                    $("#textboxNationality").val(this.Record.Nationality == null ? "" : this.Record.Nationality),
                    $("#textboxMaritalStatus").val(this.Record.MaritalStatus == null ? "" : this.Record.MaritalStatus),
                    $("#selectMembershipType").val(this.Record.Type == null ? "" : this.Record.Type),

                    $("#ethnicity").val(this.Record.Ethnicity == null ? "" : this.Record.Ethnicity),
                    document.getElementById("buttonSubmitUpdateMember").MemberID = this.Record.MemberID; //show update buttonUpdate

                $rab.Membership.Modal(true)

            }
            buttonFollowuup.onclick = new $rab.Membership.Relatives().ViewRelationships

            buttonGroups.onclick = new $rab.Membership.Relatives().ViewGroups;
            //ability to delete member from register should be done if member is a finance admin or a superuser

            btnTransfer.onclick = new $rab.Membership.Transfers().FillBranches

            var btnAll = document.createElement("button"); btnAll.innerHTML = "Profile";
            //creating dynamic properties
            btnAll.Record = members[i];
            btnAll.UpdateButton = buttonUpdate;
            btnAll.FollowUpButton = buttonFollowuup;
            btnAll.GroupsButton = buttonGroups;
            btnAll.TransfersButton = btnTransfer;
            btnAll.onclick = function () {
                try {
                    $('#modalGenericScaleBody').empty();
                    $('#modalGenericScaleTitle').empty();
                    $('#modalGenericScaleTitle').html('Manage <kbd>' + this.UpdateButton.Record.FirstName + ' ' + this.UpdateButton.Record.LastName + '</kbd >');
                    var manageContainer = document.getElementById('modalGenericScaleBody');
                    manageContainer.style.padding = '20px';
                    var btns = [this.UpdateButton, this.FollowUpButton, this.GroupsButton, this.TransfersButton];
                    //dismiss management modal form
                    btns.forEach(function (eachButton, index, btns) {
                        manageContainer.appendChild(eachButton);
                        eachButton.addEventListener("click", function () {
                            $('button[data-dismiss="modal"]').click();
                        });
                    })
                    //plot reports
                    new $rab.Membership.Reports().Run();
                    //display management modal form
                    $('button[data-target="#modalGenericScale"]').click();
                } catch (e) {

                }

            }

            tdIndex.appendChild(btnAll)


        }
    }

    this.Update = function () {
        // alert("got here okay");
        try {
            var url = "MembershipList.aspx/UpdateMemberDetails"
            var obj = {
                memberID: document.getElementById("memberID").value,
                firstName: $("#textboxFirstName").val(),
                lastName: $("#textboxLastName").val(),
                telephone: $("#textboxTelephone").val(),
                email: $("#textboxEmail").val(),
                membershipType: $("#selectMemType").val()
            }
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
    this.ProperAgeCategorisation = function (agegroup) {
        switch (agegroup) {
            case "Above 35":
                return "Adult";
                break;
            case "Young Adults(20-35)":
                return "Youth";
                break;
            case "Teenage(13-19)":
                return "Teenage";
                break;
            case "Children (0-12)":
                return "Children";
                break;
            default:
        }
    }
    this.ViewRelationships = function () {
        try {
            alert(this.Record.LastName);
        } catch (e) {

        }
    }
}
$rab.Membership.AddNewMember = function () {
    try {
        // all selection are required


        var url, obj, handler;
        url = 'MembershipList.aspx/AddNewMember';
        obj = {
            title: $("#selectNewMemberTitle").val(),
            branchName: $("#selectBranchNames").val(),
            FirstName: $("#textboxNewMemberFirstName").val(),
            LastName: $("#textboxNewMemberLastName").val(),
            Address1: $("#textboxNewMemberAddressLineone").val(),
            Address2: $("#textboxNewMemberAddressLinetwo").val(),
            PostCode: $("#textboxNewMemberPostcode").val(),
            Town: $("#textboxNewMemberTown").val(),
            Email: $("#textboxNewMemberEmail").val(),
            DOB: $("#textboxNewMemberDOB").val(),
            Country: $("#selectNewMemberCountry").val(),
            Status: $("#selectMembershipType").val(),
            Telephone: $("#textboxNewMemberTelephone").val(),
            AgeCategory: $("#selectNewMemberAgeCategory").val(),
            Comment: $("#textboxNewMemberComment").val(),
            Gender: $("#selectNewMemberGender").val(),
            Nationality: $("#textboxNationality").val(),
            MaritalStatus: $("#textboxMaritalStatus").val(),
            Profession: $("#textboxProfession").val(),
            Ethnicity: $("#ethnicity").val(),
            CreatedBy: $rab.Login.User.MemberID,
            AreaID: $rab.Login.User.AreaID,
            DistrictID: $rab.Login.User.DistrictID
        };
        handler = function (jsonmessage) {
            try {
                if (jsonmessage == "Adding member failed miserably") throw new $rab.Exception(jsonmessage);
                $rab.Membership.GetMembers($('#selectBranchNames').val());
                // close the dialog form
                $("#buttonCloseNewMember").click();
                $(".modal-dialog-1 input[type=text],.modal-dialog-1 select").val("");
                alert(jsonmessage);
            } catch (e) {
                alert(e.message);
            }
        }
        //if (obj.title == "Select title") throw new $rab.Exception("Select title");
        //if (obj.AgeCategory == "Select age category" || obj.AgeCategory == null) throw new $rab.Exception("Select age category");
        //if (obj.branchName == "Please select branch" || obj.branchName == null) throw new $rab.Exception("Select branch");
        //if (obj.Gender == "Select gender" || obj.Gender == null) throw new $rab.Exception("Select gender");
        //if (obj.Status == "Select type of membership" || obj.Status == null) throw new $rab.Exception("Select type of membership");
        //if (obj.Country == "Select country" || obj.Country == null) throw new $rab.Exception("Select country");

        ////  if (obj.Email.trim().length == 0 || obj.Email == null) throw new $rab.Exception("Please input email");

        //if (obj.Nationality == "Select country" || obj.Nationality == null) throw new $rab.Exception("Select country of nationality");
        //if (obj.MaritalStatus == "Select marital status" || obj.MaritalStatus == null) throw new $rab.Exception("Select marital status");

        if (obj.FirstName.trim().length == 0) throw new $rab.Exception("Please enter first name");
        if (obj.LastName.trim().length == 0) throw new $rab.Exception("Please enter last name");



        new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
}
$rab.Membership.SaveImage = function (path) {
    try {
        //load image into image control
        //save image to server
        var img = document.getElementById("imgMemberImage");
        img.src = path.value;
    } catch (e) {
        alert(e.message);
    }
}
$(function () {
    try {
        new $rab.Security.LockDown().PagePermission($rab.Membership.Permissionset);
        $rab.Security.Church.LoadBranches("selectBranchNames");
        $rab.Security.Church.LoadBranches("selectRelativeBranch");


        setTimeout(new $rab.AuditTrail().PageVisited("Membership List"), 1000);
        // new $rab.Membership.Rules().ApplyRelatives();
        new $rab.Membership.Rules().ApplyTransfers();
        new $rab.Membership.Rules().ApplyCellGroups();
        new $rab.Membership.Rules().ApplyMemberAccounts();
        new $rab.Membership.Rules().ApplySecurityButtons();
        new $rab.Membership.Filters().Refresh();
    } catch (e) {

    }
})
$rab.Membership.Modal = function (bool) {
    if (bool) {
        //show update button and hide add new member button
        document.getElementById("buttonSubmitUpdateMember").style.display = "block";
        document.getElementById("buttonSubmitNewMember").style.display = 'none';
        $("#buttonmodalpopup").click();
        return false
    } else {
        //hide update button and show new member button
        //validate church branch
        if ($("#selectBranchNames").val() == "Please select branch") { alert("Select branch"); return; }
        document.getElementById("buttonSubmitUpdateMember").style.display = "none";
        document.getElementById("buttonSubmitNewMember").style.display = 'block';
        //empty all inputs
        $(".modal-dialog-1 input[type=text]").val("");
        $(".modal-dialog-1 select").each(function (val) {
            this.selectedIndex = 0;
        });

        $("#buttonmodalpopup").click();
        return false;
    }

}
$rab.Membership.UpdatePersonalDetails = function () {
    // alert("got here okay");
    try {
        var url = "MembershipList.aspx/UpdatePersonalDetails"
        obj = {
            memberID: document.getElementById("buttonSubmitUpdateMember").MemberID,
            title: $("#selectNewMemberTitle").val(),
            branchName: $("#selectBranchNames").val(),
            FirstName: $("#textboxNewMemberFirstName").val(),
            LastName: $("#textboxNewMemberLastName").val(),
            Address1: $("#textboxNewMemberAddressLineone").val(),
            Address2: $("#textboxNewMemberAddressLinetwo").val(),
            PostCode: $("#textboxNewMemberPostcode").val(),
            Town: $("#textboxNewMemberTown").val(),
            Email: $("#textboxNewMemberEmail").val(),
            DOB: $("#textboxNewMemberDOB").val(),
            Country: $("#selectNewMemberCountry").val(),
            Status: $("#selectMembershipType").val(),
            Telephone: $("#textboxNewMemberTelephone").val(),
            AgeCategory: $("#selectNewMemberAgeCategory").val(),
            Comment: $("#textboxNewMemberComment").val(),
            Gender: $("#selectNewMemberGender").val(),
            Nationality: $("#textboxNationality").val(),
            MaritalStatus: $("#textboxMaritalStatus").val(),
            Profession: $("#textboxProfession").val(),
        };

        //if (obj.title == "Select title") throw new $rab.Exception("Select title");
        //if (obj.AgeCategory == "Select age category" || obj.AgeCategory == null) throw new $rab.Exception("Select age category");
        //if (obj.branchName == "Select branch" || obj.branchName == null) throw new $rab.Exception("Select branch");
        //if (obj.Gender == "Select gender" || obj.Gender == null) throw new $rab.Exception("Select gender");
        //if (obj.Status == "Select type of membership" || obj.Status == null) throw new $rab.Exception("Select type of membership");
        //if (obj.Country == "Select country" || obj.Country == null) throw new $rab.Exception("Select country");
        //if (obj.FirstName.trim().length == 0) throw new $rab.Exception("Please enter first name");
        //if (obj.LastName.trim().length == 0) throw new $rab.Exception("Please enter last name");
        //if (obj.Nationality == "Select country" || obj.Nationality == null) throw new $rab.Exception("Select country of nationality");
        //if (obj.MaritalStatus == "Select marital status" || obj.MaritalStatus == null) throw new $rab.Exception("Select marital status");

        var handler = function (serverdata) {
            if (serverdata == 'Updadting member record failed miserably' || serverdata == "email address already taken") {
                alert('failed updating date');
            } else if (serverdata == 'updating member record was successful') {
                alert('Update successful');
                // reload 
                //////// $rab.Membership.GetMembers(obj.branchName);
                //$(".modal-dialog-1 input[type=text],.modal-dialog-1 select").val("");
                $("#buttonCloseNewMember").click();
                //$("#buttonSearch").click();
                //location.reload();
            }
        };
        new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
    } catch (e) {
        alert(e.message);
    }
}

$rab.Membership.FillModalWithPersonalDetails = function (person) {
    try {


        $("#selectNewMemberTitle").val(person.Title == null ? "" : person.Title.trim()),
            $("#textboxProfession").val(person.Profession == null ? "" : person.Profession),
            $("#textboxNewMemberFirstName").val(person.FirstName == null ? "" : person.FirstName),
            $("#textboxNewMemberLastName").val(person.LastName == null ? "" : person.LastName),
            $("#textboxNewMemberAddressLineone").val(person.AddressLineone == null ? "" : person.AddressLineone),
            $("#textboxNewMemberAddressLinetwo").val(person.Addresslinetwo == null ? "" : person.Addresslinetwo),
            $("#textboxNewMemberPostcode").val(person.PostCode == null ? "" : person.PostCode),
            $("#textboxNewMemberTown").val(person.Town == null ? "" : person.Town),
            $("#textboxNewMemberEmail").val(person.EmailAddress == null ? "" : person.EmailAddress),
            $("#textboxNewMemberDOB").val(person.DOB == null ? "" : person.DOB),
            $("#selectNewMemberCountry").val(person.Country == null ? "" : person.Country),
            $("#textboxNewMemberTelephone").val(person.Telephone == null ? "" : person.Telephone),
            $("#selectNewMemberAgeCategory").val(person.AgeCategory == null ? "" : person.AgeCategory),
            $("#textboxNewMemberComment").val(person.Comment == null ? "" : person.Comment),
            $("#selectNewMemberGender").val(person.Gender == null ? "" : person.Gender.trim()),
            $("#textboxNationality").val(person.Nationality == null ? "" : person.Nationality),
            $("#textboxMaritalStatus").val(person.MaritalStatus == null ? "" : person.MaritalStatus),

            $("#selectMembershipType").val(person.MembershipType == null ? "" : person.MembershipType == "Mem" ? "Member" : "Non-Member"),
            document.getElementById("buttonSubmitUpdateMember").MemberID = person.MemberID;
        // show update button
    } catch (e) {
        alert(e.message);
    }

}
$rab.Membership.Relatives = function (filter) {
    //members  is a member object containing all information about member
    //
    this.Build = function () {
        try {
            this.LoadMemberSelectionNames();
            //this.LoadMemberRelativesNames();
        } catch (e) {

        }
    }
    this.LoadMemberSelectionNames = function () {
        //filter: array of strings
        //element: select element to populate
        if (filter === null) return false;
        var option = document.createElement("option");
        option.innerHTML = "Select member name";
        option.value = 0;
        document.getElementById('selectRelationMember').appendChild(option);

        for (var i = 0; i < filter.length; i++) {
            try {
                var option = document.createElement("option");

                option.value = filter[i].MemberID;
                option.innerHTML = filter[i].LastName + " " + filter[i].FirstName;
                document.getElementById('selectRelationMember').appendChild(option);

            } catch (e) {

            }

        }

    }
    this.LoadMemberRelativesNames = function () {
        try {
            //build rows of table with select 
            $("#tbodyrelationtype").empty();
            var tbody = document.getElementById('tbodyrelationtype');
            if (tbody == null) return;
            var url, obj, handler;
            url = "MembershipList.aspx/GetMembers";
            obj = { branchName: $("#selectRelativeBranch").val() };
            if (obj.branchName == 'Select branch') return;
            handler = function (jsondata) {
                if (jsondata == "failed getting membership list ") { alert(jsondata); return; }
                var filter = JSON.parse(jsondata);
                for (var i = 0; i < filter.length; i++) {
                    try {

                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = filter[i].MemberID;
                        tbody.rows[i].insertCell(1).innerHTML = filter[i].LastName;
                        tbody.rows[i].insertCell(2).innerHTML = filter[i].FirstName;

                        //create select with options for cell 3
                        var tdRelationshiptype = tbody.rows[i].insertCell(3);
                        var selectElementRelationship = new $rab.Membership.Relatives().RelationshipSelector();
                        tdRelationshiptype.appendChild(selectElementRelationship);

                        selectElementRelationship.Person = filter[i];

                        // append select element to cell 4 with options
                        //var tdYouAreRelatedAs = tbody.rows[i].insertCell(4);
                        //var selectElementyouAreRelatedAs = this.RelationshipSelector(); 
                        //tdYouAreRelatedAs.appendChild(selectElementyouAreRelatedAs); 

                        //selectElementyouAreRelatedAs.Person = filter[i];
                        //create the relate button and wire events
                        var buttonRelate = document.createElement("button");
                        //button relate settings
                        buttonRelate.innerHTML = "relate";
                        buttonRelate.Person = filter[i];
                        buttonRelate.SelectRelationType = selectElementRelationship;
                        buttonRelate.onclick = new $rab.Membership.Relatives().ApplyRelation;


                        //append button to cell 6
                        var tdcellRelate = tbody.rows[i].insertCell(4);
                        tdcellRelate.appendChild(buttonRelate);

                        //select control have to know each other
                        //selectElementyouAreRelatedAs
                        //selectElementRelationship
                        //selectElementRelationship.Twin = selectElementyouAreRelatedAs;
                        //selectElementyouAreRelatedAs.Twin = selectElementRelationship;

                        //selectElementRelationship   .Gender = filter[i].Gender;
                        //selectElementyouAreRelatedAs.Gender = filter[i].Gender;

                        //selectElementyouAreRelatedAs.onchange = this.SelectElementRelationshipMapper
                        selectElementRelationship.onchange = this.SelectElementRelationshipMapper;

                        //selectElementRelationship.onchange = function () {
                        //    //check if member name is not selected name
                        //    try {
                        //        var memberbeingRelated = document.getElementById("selectRelationMember").options[document.getElementById("selectRelationMember").selectedIndex].innerHTML;
                        //        if (memberbeingRelated == "select type") return;
                        //        var selectedRelative = this.Person.LastName + " " + this.Person.FirstName;
                        //        if (memberbeingRelated == selectedRelative) { alert('Cant self relate a member'); return; }

                        //    } catch (e) {

                        //    }
                        //}




                    } catch (e) {

                    }
                }

            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler);

        } catch (e) {

        }
    }
    this.RelationshipSelector = function () {
        //returns a select element with relationship names
        var filter = [
            "Guardian",
            "Father",
            "Mother",
            "Brother",
            "Sister",
            "Auntie",
            "Uncle",
            "Cousin",
            "Grand father",
            "Grand mother",
            "Step-mum",
            "Step-dad",
            "Husband",
            "Wife",
            "Son",
            "Daughter",

        ];
        filter.sort();
        var select = document.createElement("select");
        var option = document.createElement("option");
        option.innerHTML = "select type";
        option.value = "select type";
        select.appendChild(option);
        select.selectedIndex = 0;
        for (var i = 0; i < filter.length; i++) {
            try {
                var option = document.createElement("option");

                option.value = filter[i];
                option.innerHTML = filter[i];
                select.appendChild(option);

            } catch (e) {

            }

        }
        return select;
    }
    this.ApplyRelation = function () {
        // this.Person: person related
        // this.SelectRelationType: person relation type
        // person being related
        var memberbeingRelated = document.getElementById("selectRelationMember").options[document.getElementById("selectRelationMember").selectedIndex].innerHTML;
        var selectedRelative = this.Person.LastName + " " + this.Person.FirstName;
        try {
            var selectedrelationName = this.SelectRelationType.value;
            if ($("#selectBranchNames").val() == "Please select branch") { alert("Please select branch"); return; }
            if (memberbeingRelated == 'Select member name') { alert('Please select member to relate first'); document.getElementById("selectRelationMember").focus(); return; }
            if (selectedrelationName == 'select type') { alert('invalid relationship'); return; }
            if (memberbeingRelated == selectedRelative) { alert("Cant self relate"); return };

            var message = memberbeingRelated + " is now related to " + selectedRelative + " as " + this.SelectRelationType.value;
            var ans = confirm(message);
            //send changes to server
            var relObj = {
                branchid: new $rab.Branch().BranchInfo.BranchID,
                memberID: document.getElementById("selectRelationMember").value,
                relativeID: this.Person.MemberID,
                relationType: this.SelectRelationType.value,
                createdBy: $rab.Login.User.MemberID,
                createdOn: 0
            }
            var url = 'MembershipList.aspx/AddRelationship';
            new $rab.Server.Method().BeginInvoke(url, { relative: relObj },
                function (jsondata) {
                    try {
                        var parsed = JSON.parse(jsondata);

                    } catch (e) {

                    }
                });
        } catch (e) {

        }
    }
    this.RemoveRelation = function () {
        try {

        } catch (e) {

        }
    }
    this.ViewRelationships = function () {
        try {
            //this.Record: contains member information

            var url = 'MembershipList.aspx/GetMemberRelationships'
            //get all related members
            if (this.Record == null) { alert('member unknown'); return; }
            $('#tbodyMemberRelations').empty();
            $("#modal-View-title").html(this.Record.LastName + " " + this.Record.FirstName);
            new $rab.Server.Method().BeginInvoke(url, { memberID: this.Record.MemberID },
                function (jsondata) {
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == 'success') {
                        //member has relationship
                        if (parsed.result.length == 0) {
                            alert('member has not relatives'); return false;
                        }
                        //populate table with relatives
                        var tbody = document.getElementById('tbodyMemberRelations');
                        if (tbody == null) { alert('failed to build relationship table'); return false; }
                        $(tbody).empty();
                        for (var i = 0; i < parsed.result.length; i++) {
                            try {
                                tbody.insertRow(i);

                                tbody.rows[i].insertCell(0).innerHTML = parsed.result[i].IsRelatedTo;
                                tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].RelationType;
                                tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].Contact;
                                tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].RelativeBranchName;
                                tbody.rows[i].insertCell(4).innerHTML = parsed.result[i].CreatedBy;
                                var tdbutton = tbody.rows[i].insertCell(5);
                                var button = document.createElement('button');
                                button.innerHTML = 'delete';
                                button.Record = parsed.result[i];
                                tdbutton.appendChild(button);
                                button.tableRow = tbody.rows[i];
                                button.onclick = new $rab.Membership.Relatives().AmendRelationship;
                                //tbody.rows[i].insertCell(0).innerHTML = As;
                                //tbody.rows[i].insertCell(0).innerHTML = CreatedBy ;
                                //tbody.rows[i].insertCell(0).innerHTML = CreatedOn;



                            } catch (e) {

                            }
                        }
                        var button = document.getElementById('buttonRelationship').click();
                    } else {
                        alert(parsed.message);
                    }

                });
        } catch (e) {

        }
    }
    this.AmendRelationship = function () {
        try {
            var tablerow = this.tableRow;
            if (this.Record == null) { alert('relative ID couldnt be resolved, deleting relative failed'); };
            var url = 'MembershipList.aspx/RemoveRelationship';
            new $rab.Server.Method().BeginInvoke(url, { relationID: this.Record.RelationID },
                function (jsondata) {
                    try {
                        var parsed = JSON.parse(jsondata);
                        if (parsed == null) throw new Error('removing relationship failed');
                        if (parsed.message == 'success') {
                            $(tablerow).remove();
                        }
                    } catch (e) {
                        alert(e.message);
                    }


                });
        } catch (e) {

        }
    }
    this.SelectElementRelationshipMapper = function () {
        //check if member name is not selected name
        try {
            var memberbeingRelated = document.getElementById("selectRelationMember").options[document.getElementById("selectRelationMember").selectedIndex].innerHTML;
            if (memberbeingRelated == "Select member name") return;
            var selectedRelative = this.Person.LastName + " " + this.Person.FirstName;
            if (memberbeingRelated == selectedRelative) { alert('Cant self relate a member'); return; }
            return

            if (this.value == "Mother" && this.Gender == "Female") $(this.Twin).val("Daughter");
            if (this.value == "Mother" && this.Gender == "Male") $(this.Twin).val("Son");

            if (this.value == "Father" && this.Gender == "Female") $(this.Twin).val("Daughter");
            if (this.value == "Father" && this.Gender == "Male") $(this.Twin).val("Son");

            if (this.value == "Brother" && this.Gender == "Female") $(this.Twin).val("Sister");
            if (this.value == "Brother" && this.Gender == "Male") $(this.Twin).val("Brother");

            if (this.value == "Sister" && this.Gender == "Female") $(this.Twin).val("Sister");
            if (this.value == "Sister" && this.Gender == "Male") $(this.Twin).val("Brother");

            if (this.value == "Wife" && this.Gender == "Male") $(this.Twin).val("Husband");
            if (this.value == "Husband" && this.Gender == "Female") $(this.Twin).val("Wife");
            if (this.value == "Couson") $(this.Twin).val("Couson");



        } catch (e) {

        }
    }
    this.ViewGroups = function (member) {
        try {
            //this.Record: contains member information

            var url = 'MembershipList.aspx/GetMemberCellGroups'
            //get all related members
            if (this.Record == null) { alert('member unknown'); return; }
            $('#tbodyMemberGroups').empty();
            $("#modal-View-group-title").html(this.Record.LastName + " " + this.Record.FirstName);
            new $rab.Server.Method().BeginInvoke(url, { memberID: this.Record.MemberID },
                function (jsondata) {
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == 'success') {
                        //member has relationship
                        if (parsed.result.length == 0) {
                            alert('member not linked to any cell groups'); return false;
                        }
                        //populate table with relatives
                        var tbody = document.getElementById('tbodyMemberGroups');
                        if (tbody == null) { alert('failed to build group table'); return false; }
                        $(tbody).empty();
                        for (var i = 0; i < parsed.result.length; i++) {
                            try {
                                tbody.insertRow(i);

                                tbody.rows[i].insertCell(0).innerHTML = parsed.result[i].Groupname,
                                    tbody.rows[i].insertCell(1).innerHTML = parsed.result[i].Role,
                                    // tbody.rows[i].insertCell().innerHTML = parsed.result[i].Datejoined,
                                    tbody.rows[i].insertCell(2).innerHTML = parsed.result[i].ActiveStatus,
                                    tbody.rows[i].insertCell(3).innerHTML = parsed.result[i].Meetingday,
                                    tbody.rows[i].insertCell(4).innerHTML = parsed.result[i].Meetingtime,
                                    tbody.rows[i].insertCell(5).innerHTML = parsed.result[i].Location


                                var tdbutton = tbody.rows[i].insertCell(6);
                                var button = document.createElement('button');
                                button.innerHTML = 'remove';
                                button.Record = parsed.result[i];
                                tdbutton.appendChild(button);
                                button.tableRow = tbody.rows[i];
                                button.onclick = new $rab.Membership.Relatives().RemoveGroup;
                                //tbody.rows[i].insertCell(0).innerHTML = As;
                                //tbody.rows[i].insertCell(0).innerHTML = CreatedBy ;
                                //tbody.rows[i].insertCell(0).innerHTML = CreatedOn;



                            } catch (e) {

                            }
                        }
                        var button = document.getElementById('buttonRelationshipGroups').click();
                    } else {
                        alert(parsed.message);
                    }

                });
        } catch (e) {

        }
    }
    this.RemoveGroup = function () {
        try {

            try {
                var tablerow = this.tableRow;
                if (this.Record == null) { alert('Group ID couldnt be resolved, deleting group failed'); };
                var url = 'MembershipList.aspx/RemoveGroup';
                new $rab.Server.Method().BeginInvoke(url, { groupID: this.Record.ID },
                    function (jsondata) {
                        try {
                            var parsed = JSON.parse(jsondata);
                            if (parsed == null) throw new Error('removing relationship failed');
                            if (parsed.message == 'success') {
                                $(tablerow).remove();
                            }
                        } catch (e) {
                            alert(e.message);
                        }


                    });
            } catch (e) {

            }
        } catch (e) {

        }
    }
}
$rab.Membership.Rules = function () {
    //this section show what user is allowed to see and
    //not to see
    this.LoginType = $rab.Login.User.LoginType;
    this.ApplyRelatives = function () {
        try {
            //relatives should only be seen by FinanceAdmin,SuperUser
            if (["SuperUser", "FinanceAdmin"].indexOf(this.LoginType) == -1) {  //hide relationship tab
                $("#buttonTabRelation").remove();

            }
        } catch (e) {

        }
    }
    this.ApplyTransfers = function () {
        try {
            //relatives should only be seen by SuperUser
            if (["SuperUser"].indexOf(this.LoginType) == -1) {  //hide relationship tab
                $("#buttonTabTransfers").remove();

            }
        } catch (e) {

        }
    }
    this.ApplyCellGroups = function () {
        try {
            //relatives should only be seen by FinanceAdmin,SuperUser,Presbyter
            if (["SuperUser", "FinanceAdmin", "Presbyter"].indexOf(this.LoginType) == -1) {  //hide relationship tab
                $("#buttonTabCellGroups").remove();

            }
        } catch (e) {

        }
    }
    this.ApplyMemberAccounts = function () {
        try {
            //relatives should only be seen by FinanceAdmin,SuperUser
            if (["SuperUser", "FinanceAdmin"].indexOf(this.LoginType) == -1) {  //hide relationship tab
                $("#buttonTabManagement").remove();

            }
        } catch (e) {

        }
    }
    this.ApplySecurityButtons = function () {
        try {
            //relatives should only be seen by FinanceAdmin,SuperUser
            if (["SuperUser", "FinanceAdmin"].indexOf(this.LoginType) == -1) {  //hide relationship tab
                document.getElementById("buttonExportMembership").disabled = true;
                document.getElementById("buttonSettings").disabled = true;
                document.getElementById("buttonActivtateMemberUpdate").disabled = true;
            }
        } catch (e) {

        }
    }

}
$rab.Membership.Filters = function (jsondata) {
    this.AddMembershipType = function (arraystring) {

        this.Add(arraystring, 'MembershipType', 'Membership', this.FillMembershipType);

    }
    this.AddMembershipTitle = function (arraystring) {
        try {
            this.Add(arraystring, 'Title', 'Membership', this.FillMembershipType);


        } catch (e) {

        }
    }
    this.Add = function (arrayValue, name, pageName, handler) {
        //arrayValue: array value to be stored
        //name: filter name to be used
        //page: filter belongs to
        if (name == null || name.toString().trim().length == 0) return;
        //if (typeof arrayValue != 'object') return;
        if (arrayValue == null || arrayValue.toString().trim().length == 0) return;
        if (pageName == null || pageName.toString().trim().length == 0) return;
        try {
            //add data to dictionary table
            var url, obj, handler;
            url = 'Accounts.aspx/AddDictionary';
            obj = {
                array: arrayValue,
                name: name,
                pageName: pageName
            };
            handler = function (jsondata) {
                try {
                    var parsed = JSON.parse(jsondata);
                    if (parsed.message == 'success') {
                        alert('success');
                        $('#textboxfilterMembershiptypes, #textboxfilterMembershipTitles').val('');
                        $('#buttonclosememberfilter').click()
                        //["selectViewMembershipType", "selectMemType"].forEach(function (value,index) {
                        //    try {
                        //        $(this).empty();
                        //        for (var i = 0; i < parsed.result.length; i++) {
                        //            var option = document.createElement("option");
                        //            document.getElementById(value).appendChild(parsed.result[i].Value);

                        //        }
                        //    } catch (e) {

                        //    }
                        //});
                    }
                } catch (e) {
                    alert(e.message);
                }
            }
            new $rab.Server.Method().BeginInvoke(url, obj, handler);

        } catch (e) {

        }
    }
    this.Refresh = function () {
        try {
            //get data from data
            var url, obj;
            obj = {
                pageName: "Membership",
                filterName: "MembershipType"
            }
            url = "Accounts.aspx/GetDictionary";
            new $rab.Server.Method().BeginInvoke(url, obj,
                function (jsondata) {
                    //var parsed = JSON.parse(jsondata);
                    if (jsondata == null || jsondata.length == 0) {
                        try {
                            return;
                        } catch (e) {

                        }
                    }
                    try {
                        ["selectViewMembershipType", "selectMemType", "selectMembershipType"].forEach(function (value, index) {
                            try {
                                $("#" + value).empty();
                                var option = document.createElement("option");
                                option.value = "Select membership type";
                                option.innerHTML = "Select membership type";
                                document.getElementById(value).appendChild(option);
                                $rab.MembershipTitles = jsondata;
                                for (var i = 0; i < jsondata.length; i++) {
                                    var option = document.createElement("option");
                                    option.value = jsondata[i];
                                    option.innerHTML = jsondata[i];
                                    document.getElementById(value).appendChild(option);

                                }
                            } catch (e) {

                            }
                        });
                    } catch (e) {

                    }
                });
        } catch (e) {

        }
    }
    this.RefreshTitle = function () {
        try {
            //get data from data
            var url, obj;
            obj = {
                pageName: "Membership",
                filterName: "Title"
            }
            url = "Accounts.aspx/GetDictionary";
            new $rab.Server.Method().BeginInvoke(url, obj,
                function (jsondata) {
                    //var parsed = JSON.parse(jsondata);
                    try {
                        ["selectNewMemberTitle"].forEach(function (value, index) {
                            try {
                                $("#" + value).empty();
                                //add default selection
                                var option = document.createElement("option");
                                option.value = "Select title";
                                option.innerHTML = "Select title";
                                document.getElementById(value).appendChild(option);

                                for (var i = 0; i < jsondata.length; i++) {
                                    var option = document.createElement("option");
                                    option.value = jsondata[i];
                                    option.innerHTML = jsondata[i];
                                    document.getElementById(value).appendChild(option);

                                }
                            } catch (e) {

                            }
                        });
                    } catch (e) {

                    }
                });
        } catch (e) {

        }
    }
    this.RefreshCellGroups = function () {
        try {
            //get data from data
            var url, obj;
            obj = {
                pageName: "Membership",
                filterName: "CellGroupName"
            }
            url = "Accounts.aspx/GetDictionary";
            new $rab.Server.Method().BeginInvoke(url, obj,
                function (jsondata) {
                    //var parsed = JSON.parse(jsondata);
                    try {
                        ["selectNewMemberTitle"].forEach(function (value, index) {
                            try {
                                $("#" + value).empty();
                                //add default selection
                                var option = document.createElement("option");
                                option.value = "Select title";
                                option.innerHTML = "Select title";
                                document.getElementById(value).appendChild(option);

                                for (var i = 0; i < jsondata.length; i++) {
                                    var option = document.createElement("option");
                                    option.value = jsondata[i];
                                    option.innerHTML = jsondata[i];
                                    document.getElementById(value).appendChild(option);

                                }
                            } catch (e) {

                            }
                        });
                    } catch (e) {

                    }
                });
        } catch (e) {

        }
    }
    this.AddCellGroupNames = function (arraystring) {
        this.Add(arraystring, 'CellGroupName', 'Membership', this.FillMembershipType);

    }
}
$rab.Membership.Transfers = function () {
    this.FillBranches = function () {
        try {
            //display transfer dialog
            var fullname = this.Record.LastName + " " + this.Record.FirstName;
            $rab.TempMemberBeingTransfered = this.Record;
            $("#modal-modaltransfer-title").html(fullname);
            var obj = {
                fromBranch: $("#selectBranchNames").val(),
                toBranch: "",
                memberID: this.Record.MemberID,
                createdBy: $rab.Login.User.MemberID,
                createdOn: 0,
                transferDate: 0,

            }
            var func = function (result) {
                $rab.Membership.DistrictAreaGrouping = result;
                try {
                    if (typeof result == 'undefined' || result == null) { throw new Error('Failed getting area and district names') }
                    //fill area names
                    //   var area_namesArray = result.filter(function (val) { return val.BranchGroupingType == 'Area' });
                    $("#selectAreaName").empty();
                    if (result.Areas != null) {
                        var option = document.createElement("option");
                        option.value = null;
                        option.innerHTML = "Select area name";
                        document.getElementById("selectAreaName").appendChild(option);
                        //--------------------------------------------------------------------
                        for (var i = 0; i < result.Areas.length; i++) {
                            var option = document.createElement("option");
                            option.value = result.Areas[i].ID;
                            option.AreaName = result.Areas[i].Name;
                            option.innerHTML = result.Areas[i].Name;
                            document.getElementById("selectAreaName").appendChild(option);
                        }
                    }
                    $("#buttontransfer").click();
                } catch (e) {
                    alert(e.message);
                }
                //if (filter == null) return;
                //$("#selectTransferToBranch").empty();
                ////---------------------------------------------------------------------
                //var option = document.createElement("option");
                //option.value = "Select branch";
                //option.innerHTML = "Select branch";
                //document.getElementById("selectTransferToBranch").appendChild(option);
                ////--------------------------------------------------------------------
                //for (var i = 0; i < filter.length; i++) {
                //    var option = document.createElement("option");

                //        option.value = filter[i].BranchName;
                //        option.innerHTML = filter[i].BranchName;
                //        document.getElementById("selectTransferToBranch").appendChild(option);
                //}
                //$("#modal-modaltransfer-title").html(fullname);
                //document.getElementById("buttonsubmittransfer").transferData = obj;

            }
            new $rab.Membership.Transfers().ViewHistory(this.Record.MemberID);
            // $rab.Church.GetAllBranches(func);
            $rab.Church.GetDistrictAndAreas(func);

        } catch (e) {
            alert(e.message);
        }
    }
    this.Add = function () {
        try {
            //var data = document.getElementById("buttonsubmittransfer").transferData;
            //data.transferDate = $("#textboxtransferDate").val();
            //data.transferType = $("#selectTransferType").val();
            //if (data.transferType == "Internal") {
            //    data.transferBranch = $("#selectTransferToBranch").val();
            //} else if (data.transferType == "External") {
            //    data.transferBranch = $("#textboxNewBranch").val();
            //}
            var obj = {
                areaID: $('#selectAreaName').val(),
                distID: $('#selectDistrictName').val(),
                toBranch: $('#selectTransferToBranch').val(),
                fromBranch: new $rab.Branch().BranchInfo.BranchID,
                transferType: $('#selectTransferType').val(),
                transferDate: $('#textboxtransferDate').val(),
                memberID: $rab.TempMemberBeingTransfered.MemberID,
                createdBy: $rab.Login.User.MemberID,
                createdOn: new Date().toLocaleDateString('se').replace(/\D/g, '')
            }
            if (!isFinite(obj.areaID)) { alert('Select Area name      '); return }
            if (!isFinite(obj.distID)) { alert('Select District name      '); return }
            if (!isFinite(obj.toBranch)) { alert('Select to Branch    '); return }
            if (!isFinite(obj.fromBranch)) { alert('Select from Branch  '); return }
            if ((obj.transferType.trim().length == 0)) { alert('Select transferType'); return }
            if ((obj.transferDate.trim().length == 0)) { alert('Enter transferdate'); return }
            if (!isFinite(obj.memberID)) { alert('Select memberID    '); return }
            if (!isFinite(obj.createdBy)) { alert('Select createdBy   '); return }
            if (!isFinite(obj.createdOn)) { alert('Select createdOn   '); return }

            new $rab.Server.Method().BeginInvoke("MembershipList.aspx/AddNewTransfer", { transfer: obj }, function (jsonddata) {
                try {
                    var parse = JSON.parse(jsonddata);
                    if (parse.message = 'success') {
                        alert('transfered');
                        $('#buttoncloseTransfer').click();
                        //new $rab.Membership.Transfers().Build(parse.result);
                        $rab.Membership.GetMembersV2();

                    }
                } catch (e) {

                }
            });

        } catch (e) {

        }
    }
    this.Build = function (jsonddata) {
        var tbody = document.getElementById("tbodymodaltransfer");
        $(tbody).empty();
        var parsed = JSON.parse(jsonddata);
        if (parsed.message == "success") {

            var transfers = parsed.result;
            for (var i = 0; i < transfers.length; i++) {
                try {
                    tbody.insertRow(i);
                    tbody.rows[i].insertCell(0).innerHTML = transfers[i].AreaName;
                    tbody.rows[i].insertCell(1).innerHTML = transfers[i].DistrictName;
                    tbody.rows[i].insertCell(2).innerHTML = transfers[i].FromBranch;
                    tbody.rows[i].insertCell(3).innerHTML = transfers[i].ToBranch;
                    tbody.rows[i].insertCell(4).innerHTML = transfers[i].TransferDate;
                    // tbody.rows[i].insertCell(5).innerHTML = transfers[i].CreatedBy;
                    // tbody.rows[i].insertCell(6).innerHTML = transfers[i].CreatedOn;




                } catch (e) {

                }
            }


        }
    }
    this.ViewHistory = function (memberid) {
        try {
            new $rab.Server.Method().BeginInvoke("MembershipList.aspx/GetMemberTransfers", { memberID: memberid }, function (jsonddata) {
                try {
                    new $rab.Membership.Transfers().Build(jsonddata);
                } catch (e) {

                }
            });
        } catch (e) {

        }

    }
    this.LoadDistricts = function (groupingName) {
        try {
            $("#selectDistrictName,#selectTransferToBranch").empty();
            if ($rab.Membership.DistrictAreaGrouping == null) { throw new Error('No districts names to load'); }

            var result = $rab.Membership.DistrictAreaGrouping.Areas.
                filter(function (val) {
                    return val.Name == groupingName
                });
            if (result.length != 0) {


                var option = document.createElement("option");
                option.value = null;
                option.innerHTML = "Select district name";
                document.getElementById("selectDistrictName").appendChild(option);
                //--------------------------------------------------------------------
                for (var i = 0; i < result[0].Districts.length; i++) {
                    var option = document.createElement("option");
                    option.value = result[0].Districts[i].ID;
                    option.DistrictName = result[0].Districts[i].Name;
                    option.innerHTML = result[0].Districts[i].Name;
                    document.getElementById("selectDistrictName").appendChild(option);
                }
            }
        } catch (e) {

        }
    }
    this.LoadLocals = function (groupingName) {
        try {
            $("#selectTransferToBranch").empty();
            if ($rab.Membership.DistrictAreaGrouping == null) { throw new Error('No districts names to load'); }
            var myfilter = {
                areaID: $('#selectAreaName').val(),
                distID: $('#selectDistrictName').val()

            };
            new $rab.Server.Method()
                .BeginInvoke("Accounts.aspx/GetLocals", myfilter,
                    function (jsondata) {
                        try {
                            var parse = JSON.parse(jsondata);
                            if (parse.message == 'success') {
                                var option = document.createElement("option");
                                option.value = null;
                                option.innerHTML = "Select branch";
                                document.getElementById("selectTransferToBranch").appendChild(option);
                                //--------------------------------------------------------------------
                                for (var i = 0; i < parse.result.length; i++) {
                                    var option = document.createElement("option");
                                    option.value = parse.result[i].ID;
                                    option.innerHTML = parse.result[i].Name;
                                    option.AreaID = parse.result[i].AreaID
                                    option.DistrictID = parse.result[i].DistrictID
                                    document.getElementById("selectTransferToBranch").appendChild(option);
                                }

                            } else {
                                //alert('Failed getting loca');
                            }

                        } catch (e) {

                        }
                    })
            //var result = $rab.Membership.DistrictAreaGrouping.Areas.
            //    filter(function (val) {
            //        return val.Name == myfilter.areaName
            //    });
            //var locals = result[0].Districts.
            //    filter(function (val) {
            //        return val.Name == myfilter.distName
            //    });
            //if (result.length != 0) {


            //    var option = document.createElement("option");
            //    option.value = null;
            //    option.innerHTML = "Select district name";
            //    document.getElementById("selectTransferToBranch").appendChild(option);
            //    //--------------------------------------------------------------------
            //    for (var i = 0; i < result[0].Districts.length; i++) {
            //        var option = document.createElement("option");
            //        option.value = result[0].Districts[i].ID;
            //        option.innerHTML = result[0].Districts[i].Name;
            //        document.getElementById("selectTransferToBranch").appendChild(option);
            //    }
            //}
        } catch (e) {

        }
    }
}
$rab.MassUpate = function () {
    this.buildTable = function () {
        try {
            //alert(JSON.stringify($rab.Membership.Temp));
            //build table

            var funch = function (jsondata) {
                if (typeof jsondata != 'undefined') {
                    var list = JSON.parse(jsondata);
                    if (list.length == 0) { alert('Please load membership in membership tab before loading continuing'); return; }
                    var tbody = document.getElementById("tbodyMassUpdate");
                    var imgUpdateButton = document.getElementById("imgUpdateAll");
                    var array = [];//holds all updated records
                    var getValue = function (td, value) {
                        td.innerHTML = value;
                        return value;
                    }
                    $(tbody).empty();
                    for (var i = 0; i < list.length; i++) {
                        try {
                            //
                            var button = document.createElement('button');
                            button.innerHTML = "update";
                            tbody.insertRow(i);
                            tbody.rows[i].insertCell(0).appendChild(button);
                            var obj = {
                                memberID: list[i].MemberID,
                                title: getValue(tbody.rows[i].insertCell(1), list[i].Title),
                                FirstName: getValue(tbody.rows[i].insertCell(2), list[i].FirstName),
                                LastName: getValue(tbody.rows[i].insertCell(3), list[i].LastName),
                                Address1: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(4), list[i].AddressLineone),
                                Address2: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(5), list[i].AddressLinetwo),
                                PostCode: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(6), list[i].Postcode),
                                Town: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(7), list[i].Town),
                                Email: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(8), list[i].Email),
                                DOB: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(9), list[i].DOB),
                                Country: new $rab.MassUpate().getCountries(tbody.rows[i].insertCell(10), list[i].Country),
                                Status: new $rab.MassUpate().getMembershipType(tbody.rows[i].insertCell(11), list[i].Type),
                                Telephone: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(12), list[i].Telephone),
                                AgeCategory: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(13), list[i].AgeCategory),
                                Comment: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(14), list[i].Comment),
                                Gender: new $rab.MassUpate().getGender(tbody.rows[i].insertCell(15), list[i].Gender),
                                Nationality: new $rab.MassUpate().getCountries(tbody.rows[i].insertCell(16), list[i].Nationality),
                                MaritalStatus: new $rab.MassUpate().getMaritalStatus(tbody.rows[i].insertCell(17), list[i].MaritalStatus),
                                Profession: new $rab.MassUpate().setTextBoxValue(tbody.rows[i].insertCell(18), list[i].Profession),
                                Ethnicity: new $rab.MassUpate().getEthnicity(tbody.rows[i].insertCell(19), list[i].Ethnicity),

                            }

                            button.obj = obj;
                            array.push(obj);
                            button.onclick = function () {
                                new $rab.MassUpate().update(this.obj);
                            }
                        } catch (e) {
                            //alert(e.message);
                        }
                    }
                    imgUpdateButton.UpdateObjects = array;
                }
            }
            var list = this.getMembers(funch);
        } catch (e) {
            alert(e.message);
        }
    }
    this.getTitle = function (td, title) { }
    this.getSelectElement = function (array, title) {
        //array :string array 
        //title :default selected option
        var select = document.createElement("select");
        var option = document.createElement("option");
        select.appendChild(option);
        select.selectedIndex = 0;
        if (typeof array != 'undefined' && typeof title != 'undefined') {
            option.value = title; option.innerHTML = title;
            for (var i = 0; i < array.length; i++) {

                try {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.innerHTML = array[i];
                    select.appendChild(option);
                } catch (e) {

                }
            }
        }
        return select;
    }
    this.setTextBoxValue = function (td, value) {
        var textbox = document.createElement("input");

        try {
            textbox.type = "text";
            textbox.value = value;
            td.appendChild(textbox);
        } catch (e) {

        }
        return textbox;
    }
    this.getCountries = function (td, value) {

        var select = $('#textboxNationality').clone()[0] //this.getSelectElement([""], "Select ethnicity")
        select.classList.remove('form-control');
        if (typeof value == 'undefined') select.selectedIndex = 0;
        else select.value = value;
        td.appendChild(select);
        return select;
    }
    this.getAgeCategory = function (td) {
        var select = this.getSelectElement([""], "Select Age Category")
        td.appendChild(select);
        return select;
    }
    this.getMembershipType = function (td, value) {
        new $rab.Membership.Filters().Refresh();
        var select = this.getSelectElement($rab.MembershipTitles, "Select membership type")
        select.value = value;
        td.appendChild(select);
        return select;
    }
    this.getGender = function (td, gender) {
        var select = this.getSelectElement(["Male", "Female"], "Select gender");
        $(select).val(gender);
        td.appendChild(select);
        return select;
    }
    this.getEthnicity = function (td, value) {
        var select = $('#ethnicity').clone()[0] //this.getSelectElement([""], "Select ethnicity")
        select.classList.remove('form-control');
        if (typeof value == 'undefined') select.selectedIndex = 0;
        else select.value = value;
        td.appendChild(select);
        return select;
    }
    this.getMaritalStatus = function (td, status) {
        var select = this.getSelectElement(["Married", "Single", "Widow", "Widower", "N/A"], "Select status");
        $(select).val(status);
        td.appendChild(select);
        return select;
    }
    this.update = function (ob, showAlert) {

        try {
            var url = "MembershipList.aspx/UpdateAllMemberDetails"
            obj = {
                memberID: ob.memberID,
                title: $(ob.title).val(),
                branchName: $("#selectBranchNames").val(),
                FirstName: ob.FirstName,
                LastName: ob.LastName,
                Address1: $(ob.Address1).val(),
                Address2: $(ob.Address2).val(),
                PostCode: $(ob.PostCode).val(),
                Town: $(ob.Town).val(),
                Email: $(ob.Email).val(),
                DOB: $(ob.DOB).val(),
                Country: $(ob.Country).val(),
                Status: $(ob.Status).val(),
                Telephone: $(ob.Telephone).val(),
                AgeCategory: $(ob.AgeCategory).val(),
                Comment: $(ob.Comment).val(),
                Gender: $(ob.Gender).val(),
                Nationality: $(ob.Nationality).val(),
                MaritalStatus: $(ob.MaritalStatus).val(),
                Profession: $(ob.Profession).val(),
                Ethnicity: $(ob.Ethnicity).val(),
            };


            var handler = function (serverdata) {
                if (serverdata == 'Updadting member record failed miserably' || serverdata == "email address already taken") {
                    alert('failed updating date');
                } else if (serverdata == 'updating member record was successful') {
                    if (typeof showAlert == 'undefined') { alert(serverdata); $rab.Membership.GetMembersV2(); }

                }
            };
            new $rab.Server.Method().BeginInvoke(url, { mem: obj }, handler);
        } catch (e) {
            alert(e.message);
        }
    }
    this.getNationality = function (td) {
        var select = this.getSelectElement([""], "Select country")
        td.appendChild(select);
        return select;
    }
    this.UpdateAll = function () {
        try {
            var imgUpdateButton = document.getElementById("imgUpdateAll");
            if (typeof imgUpdateButton.UpdateObjects == 'undefined') { alert('no records to update'); return };
            if (confirm('Update all records, this may take some few minutes to update depending on size of data, click OK to continue, Cancel to cancel ')) {

                /*UpdateObjects: update object was set when table was built
                  it holds an array of all records
                 */

                for (var i = 0; i < imgUpdateButton.UpdateObjects.length; i++) {
                    try {
                        this.update(imgUpdateButton.UpdateObjects[i], false);
                    } catch (e) {

                    }

                }
                //reload all controls
                this.buildTable();
            }

        } catch (e) {

        }
    }
    this.getMembers = function (funch) {
        //function to execute when data is returned fromt the server
        var obj = {
            branchName: new $rab.Branch().BranchInfo.BranchName,
        }
        var url = "MembershipList.aspx/GetMembers"
        new $rab.Server.Method().BeginInvoke(url,
            obj,
            function (jsondata) {
                try {

                    funch(jsondata);

                } catch (e) {

                }

            });
    }
}
$rab.Membership.Upate = function () {
    this.url = "MemberUpdate.aspx"
    this.activate = function () {
        try {
            var dispatch = new $rab.Server.Dispatcher();
            dispatch.handler = function (msg) { alert(msg); };
            dispatch.obj = { memberUpdateClass: { CreatedBy: $rab.Login.User.MemberID, BranchID: new $rab.Branch().BranchInfo.BranchID } };
            if (dispatch.obj.memberUpdateClass.BranchID == null || typeof dispatch.obj.memberUpdateClass.BranchID == 'undefined') { alert('Select branch'); return; }
            dispatch.url = this.url + "/Activate";
            dispatch.invoke();
        } catch (e) {

        }
    }
    this.deactivate = function () {
        try {

            var dispatch = new $rab.Server.Dispatcher();
            dispatch.handler = function (msg) { alert(msg); };
            dispatch.obj = { Id: $rab.Login.User.BranchID };
            dispatch.url = this.url + "/DeActivate";
            dispatch.invoke();
        } catch (e) {

        }
    }
    this.launch = function () {
        try {
            var tbody = document.getElementById('tbodygeneral');
            var thead = document.getElementById('theadgeneral');

            $(thead).empty();
            $(tbody).empty();
            var dispatch = new $rab.Server.Dispatcher();

            dispatch.obj = { branchID: new $rab.Branch().BranchInfo.BranchID };
            if (dispatch.obj.branchID == null || typeof dispatch.obj.branchID == 'undefined') { alert('Select branch'); return; }
            dispatch.url = this.url + "/GetMemberUpdates";
            dispatch.handler = function (list) {
                try {
                    //display list of all sessions
                    if (list != null) {
                        //create table header
                        thead.insertRow(0);
                        thead.rows[0].insertCell(0).innerHTML = "Id";
                        thead.rows[0].insertCell(1).innerHTML = "CreatedBy";
                        thead.rows[0].insertCell(2).innerHTML = "Status";
                        thead.rows[0].insertCell(3).innerHTML = "CreatedOn";
                        thead.rows[0].insertCell(4).innerHTML = "BranchID";
                        thead.rows[0].insertCell(5).innerHTML = "Link address";
                        $('#modal-general-title').html('Member activation history');
                        for (var i = 0; i < list.length; i++) {
                            tbody.insertRow(i);
                            tbody.rows[i].insertCell(0).innerHTML = list[i].Id;
                            tbody.rows[i].insertCell(1).innerHTML = list[i].CreatedBy;
                            tbody.rows[i].insertCell(2).innerHTML = list[i].Status == 1 ? "<span style='color:red;'>active</span>" : "<span style='color:green;'>inactive</span>";
                            tbody.rows[i].insertCell(3).innerHTML = list[i].CreatedOn;
                            tbody.rows[i].insertCell(4).innerHTML = list[i].BranchID;
                            tbody.rows[i].insertCell(5);
                            tbody.rows[i].cells[5].appendChild(document.createElement('a'));
                            tbody.rows[i].cells[5].firstChild.href = "MemberUpdate.aspx?hash=" + list[i].HashKey;
                            tbody.rows[i].cells[5].firstChild.innerHTML = "Link";
                            tbody.rows[i].cells[5].firstChild.target = "_blank";

                        }
                        $('#buttonGeneral').click();
                    }

                } catch (e) {

                }
            };
            dispatch.invoke();
        } catch (e) {

        }
    }
}
$rab.Membership.Columns = function () {
    this.tbodyforward = document.getElementById('tbodyforward');
    this.tbodybackward = document.getElementById('tbodybackward');
    this.displayDialog = function () {
        try {
            //check if branch has been selected
            var branch = $('#selectBranchNames').val();
            $('#buttongeneralBlank').click();
        } catch (e) {

        }
    }
    this.forward = function () {
        try {
            var length = this.tbodyforward.rows.length;
            for (var i = 0; i < length; i++) {
                if (this.tbodyforward.rows[i].cells[0].selected == true) {
                    this.tbodybackward.appendChild(this.tbodyforward.rows[i]);
                    this.tbodyforward.rows[i].cells[0].style.color = "black";
                    this.tbodyforward.rows[i].cells[0].style.backgroundColor = '';
                    this.tbodyforward.rows[i].cells[0].selected == false;
                    new $rab.Membership.Columns().forward();
                }

            }
        } catch (e) {

        }
    }
    this.backward = function () {
        try {


            var length = this.tbodybackward.rows.length;
            for (var i = 0; i < length; i++) {
                if (this.tbodybackward.rows[i].cells[0].selected == true) {
                    this.tbodyforward.appendChild(this.tbodybackward.rows[i]);
                    this.tbodybackward.rows[i].cells[0].style.color = "black";
                    this.tbodybackward.rows[i].cells[0].style.backgroundColor = '';
                    this.tbodybackward.rows[i].cells[0].selected == false
                    new $rab.Membership.Columns().backward();
                }

            }

        } catch (e) {

        }
    }
    this.updateView = function () {
        try {
            $('button[data-dismiss="modal"]').click();
            // update view with selected columns
            new $rab.Membership.Table().BuildSelected();

        } catch (e) {

        }
    }
    this.GetColumns = function () {
        try {
            //loop through table rows to get columns selected by user
            var length = this.tbodybackward.rows.length;
            var rows = new Array();
            for (var i = 0; i < length; i++) {

                rows.push(this.tbodybackward.rows[i].cells[0].innerText);
            }

        } catch (e) {

        }
        return rows;
    }

}
$rab.Membership.Settings = function () {
    this.displayDialog = function () {
        //"data-toggle="modal" data-target="#modalSettings""
        //check if branch is selected
        var selectedBranch = new $rab.Branch().BranchInfo.BranchName;
        if (selectedBranch == "Please select branch") {
            alert('Please select branch');
            return;
        }
        $('span[data-target="#modalSettings"]').click();
    }
}
$rab.Membership.Reports = function () {
    this.Run = function () {
        this.getAttendance();
        this.getContributions();
        this.getAppointments();
    }
    this.getAttendance = function (id) {
        var inv = new $rab.Server.Dispatcher();
        var btn = document.getElementById('modalGenericScaleBody');
        if (btn == null) return;
        inv.obj = { memberID: btn.firstChild.Record.MemberID };
        inv.url = "MembershipList.aspx/GetAttendanceHistory";
        inv.handler = function (data) {
            try {
                if (data != null && typeof data == 'object') {
                    //build table
                    var tbody = document.getElementById('tbodyAttendanceHistory');
                    $(tbody).empty();
                    for (var i = 0; i < data.length; i++) {
                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = data[i].ActivityName;
                        tbody.rows[i].insertCell(1).innerHTML = data[i].Date;
                        tbody.rows[i].insertCell(2).innerHTML = data[i].Count;
                    }
                }
            } catch (e) {

            }
        }
        inv.invoke();
    }

    this.getContributions = function (id) {
        var inv = new $rab.Server.Dispatcher();
        var btn = document.getElementById('modalGenericScaleBody');
        if (btn == null) return;
        inv.obj = { memberID: btn.firstChild.Record.MemberID };
        inv.url = "MembershipList.aspx/GetContributionHistory";
        inv.handler = function (data) {
            try {
                if (data != null && typeof data == 'object') {
                    //build table
                    var tbody = document.getElementById('tbodyContributionHistory');
                    $(tbody).empty();
                    for (var i = 0; i < data.length; i++) {
                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = data[i].Fund;
                        tbody.rows[i].insertCell(1).innerHTML = data[i].Date;
                        tbody.rows[i].insertCell(2).innerHTML = data[i].Amount;
                    }
                }
            } catch (e) {

            }
        }
        inv.invoke();
    }
    this.getAppointments = function () {
        var inv = new $rab.Server.Dispatcher();
        var btn = document.getElementById('modalGenericScaleBody');
        if (btn == null) return;
        inv.obj = { memberID: btn.firstChild.Record.MemberID };
        inv.url = "MembershipList.aspx/GetAppointmentHistory";
        inv.handler = function (data) {
            try {
                if (data != null && typeof data == 'object') {
                    //build table
                    var tbody = document.getElementById('tbodyAppointmentHistory');
                    $(tbody).empty();
                    for (var i = 0; i < data.length; i++) {
                        tbody.insertRow(i);
                        tbody.rows[i].insertCell(0).innerHTML = data[i].Role;
                        tbody.rows[i].insertCell(1).innerHTML = data[i].StartDate;
                        tbody.rows[i].insertCell(2).innerHTML = data[i].EndDate;
                    }
                }
            } catch (e) {

            }
        }
        inv.invoke();
    }
    this.getBirthdays = function () {
        try {
            var branchID = new $rab.Branch().BranchInfo.BranchID;
            var message = new $rab.Branch().BranchInfo.BranchName;
            if (message != null || message != "Select branch") {
                var container = document.getElementById('alertBody');
                $(container).empty();
                new $rab.View(container).birthday(branchID);
                $('#alertTitle').html('Happy birthday wishes window');
                $('button[data-target="#myBlank"]').click();
            } else {
                alert('Select branch');
            }


        } catch (e) {

        }
    }
}
$rab.Membership.Tablebuttons = function () {
    this.display = function (selectedButton) {
        //get selected row and 
        var rows = $('#tbodyMembers tr');
        if (rows != null) {
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].selected == true) {
                    //get the selected manage button
                    rows[i].cells[0].firstChild[selectedButton].click();
                }
            }
        }

    }
    this.delete = function () {
        //get selected row and 
        var rows = $('#tbodyMembers tr');
        if (rows != null) {
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].selected == true) {
                    //get the selected manage button
                    var record = rows[i].cells[0].firstChild.Record;
                    if (confirm("Delete member " + record.LastName + " " + record.FirstName + "??")) {


                        try {
                            var url, obj, handler
                            url = 'MembershipList.aspx/DeleteMember';
                            obj = {
                                branchid: new $rab.Branch().BranchInfo.BranchID,
                                memberid: record.MemberID,
                            };
                            var tr = rows[i];
                            new $rab.Server.Method().BeginInvoke(url, obj, function (jsondata) {
                                // alert(jsondata);
                                if (jsondata == "Member Deleted successfully!") {
                                    $(tr).remove();
                                }
                            });

                        } catch (e) {

                        }
                    }
                    break;
                }
            }
        }

    }
}
$rab.menu = function (event) {
    this.display = function () {
        try {
            event.preventDefault();
            var contextmenu = document.getElementById('context-menu-table')
            var relativePosition = {
                left: event.pageX,
                top: event.pageY
            };
            $(contextmenu).animate({
                left: relativePosition.left.toString() + 'px',
                top: relativePosition.top.toString() + 'px',
                //opacity: '0.5',

            });
            //contextmenu.style.left    = relativePosition.left.toString() + 'px';
            //contextmenu.style.top     = relativePosition.top.toString() + 'px';

        } catch (e) {

        }
    }
    this.clear_context = function () {
        var contextmenu = document.getElementById('context-menu-table');
        contextmenu.style.left = '-1000px';
        contextmenu.style.top = '-1000px';
    }
    this.on_menu_profile_click = function () {

        //get reference to profile button in table row and click it
        var tbody = document.getElementById('tbodyMembers');
        for (var i = 0; i < tbody.rows.length; i++) {
            if (tbody.rows[i].selected) {
                tbody.rows[i].cells[0].firstChild.click();
            }
        }
    }


    this.get_selected_member = function () {
        var selected_member = null;
        var tbody = document.getElementById('tbodyMembers');
        for (var i = 0; i < tbody.rows.length; i++) {
            if (tbody.rows[i].selected) {
                var selected_member = tbody.rows[i].cells[0].firstChild.Record;
                break;
            }
        }
        return selected_member;
    }

    this.display_next_of_kin = function () {
        //display modal form
        var selected_member = this.get_selected_member();
        var client = new $rab.Server.Dispatcher();
        client.url = 'MembershipList.aspx/GetNextOfKin'
        client.obj = { id: selected_member.MemberID }
        client.handler = function (data) {
            new $rab.menu().load_next_of_kin(data);
        }
        client.invoke();
    }
    this.add_next_of_kin = function () {
        var selected_member = this.get_selected_member();
        var obj = {
            Id: 0,
            MemberId: selected_member.MemberID,
            FullName: $('#nkfullname').val(),
            RelationType: $('#nkrelationtype').val(),
            Address: $('#nkaddress').val(),
            Country: $('#nkcountry').val(),
            Telephone: $('#nktelephone').val(),
            Email: $('#nkemail').val(),
            CreatedBy: $rab.Login.User.MemberID,
            CreatedOn: 0,
        }
        var client = new $rab.Server.Dispatcher();
        client.url = 'MembershipList.aspx/AddNextOfKin'
        client.obj = { nextOfKin: obj }
        client.handler = function (data) {
            new $rab.menu().load_next_of_kin(data);
            $('#nextofkin input[type=text]').val('');
            $('#nextofkin input[type=email]').val('');
            $('a[href=#existingnextofkins]').click();

        }
        client.invoke();

    }
    this.load_next_of_kin = function (data) {
        var selected_member = this.get_selected_member();
        if (data != null) {
            $('#table_next_of_kin').empty();
            $.each(data, function (index, value) {
            var row  = '<tr><td>' + value.FullName + '</td>';
                row += '<td>' + value.Address +      '</td>';
                row += '<td>' + value.Telephone +    '</td>';
                row += '<td>' + value.Email +        '</td>';
                row += '<td>' + value.RelationType + '<span onclick="new $rab.menu().remove_next_of_kin(' + value.Id+')" class="badge badge-primary">remove</span></td></tr>';


                $('#table_next_of_kin').append(row)
            });

            $('#nextOfKinTitle').html('Next of kin <kbd>' + selected_member.FirstName + ' ' + selected_member.LastName + '</kbd>');
            $('#divNextOfKin').modal('show');

        }
    } 
    this.remove_next_of_kin = function (Id) {
        var client = new $rab.Server.Dispatcher();
        client.url = 'MembershipList.aspx/RemoveNextOfKin'
        client.obj = { id: Id }
        client.handler = function (data) {
            new $rab.menu().load_next_of_kin(data);
        }
        client.invoke();
    }
}





