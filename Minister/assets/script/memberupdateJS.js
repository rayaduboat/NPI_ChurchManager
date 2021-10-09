$rab.Membership.Permissionset = ["All", "SuperUser", "Membership List"];
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

    this.Build = function () {
        try {
            $("#tbodyMembers").empty();
            if (jsondata == "failed getting membership list ") {
                alert(jsondata); return
            }

            var members = JSON.parse(jsondata);
            if (members.length == 0) {
                alert("Oops no members found"); return
            }
            $("#tbodyMembers").empty();
            var table = document.getElementById("tbodyMembers");
            for (var i = 0; i < members.length; i++) {
                // add member records 
                var tr = document.createElement("tr");
                var tdFirstName = document.createElement("td"); tdFirstName.className = "body-item mbr-fonts-style display-7"; tdFirstName.innerHTML = members[i].FirstName;
                var tdLastName = document.createElement("td"); tdLastName.className = "body-item mbr-fonts-style display-7"; tdLastName.innerHTML = members[i].LastName;
                var tdTelephone = document.createElement("td"); tdTelephone.className = "body-item mbr-fonts-style display-7"; tdTelephone.innerHTML = members[i].Telephone;
                var tdEmail = document.createElement("td"); tdEmail.className = "body-item mbr-fonts-style display-7"; tdEmail.innerHTML = members[i].Email;
                var tdMembershipType = document.createElement("td"); tdMembershipType.className = "body-item mbr-fonts-style display-7"; tdMembershipType.innerHTML = members[i].Type == "Mem" ? "Member" : "Non-Member";
                var tdEdit = document.createElement("td"); tdEdit.className = "body-item mbr-fonts-style display-7";//

                var button = document.createElement("span"); button.innerHTML = "Edit";
                button.Record = members[i];
                button.onclick = function () {
                    $("#selectNewMemberTitle").val(this.Record.Title == null ? "" : this.Record.Title.trim()),
                        $("#textboxProfession").val(this.Record.Profession == null ? "" : this.Record.Profession),
                        $("#textboxNewMemberFirstName").val(this.Record.FirstName == null ? "" : this.Record.FirstName),
                        $("#textboxNewMemberLastName").val(this.Record.LastName == null ? "" : this.Record.LastName),
                        $("#textboxNewMemberAddressLineone").val(this.Record.AddressLineone == null ? "" : this.Record.AddressLineone),
                        $("#textboxNewMemberAddressLinetwo").val(this.Record.Addresslinetwo == null ? "" : this.Record.Addresslinetwo),
                        $("#textboxNewMemberPostcode").val(this.Record.PostCode == null ? "" : this.Record.PostCode),
                        $("#textboxNewMemberTown").val(this.Record.Town == null ? "" : this.Record.Town),
                        $("#textboxNewMemberEmail").val(this.Record.EmailAddress == null ? "" : this.Record.EmailAddress),
                        $("#textboxNewMemberDOB").val(this.Record.DOB == null ? "" : this.Record.DOB),
                        $("#selectNewMemberCountry").val(this.Record.Country == null ? "" : this.Record.Country),
                        $("#textboxNewMemberTelephone").val(this.Record.Telephone == null ? "" : this.Record.Telephone),
                        $("#selectNewMemberAgeCategory").val(this.Record.AgeCategory == null ? "" : this.Record.AgeCategory),
                        $("#textboxNewMemberComment").val(this.Record.Comment == null ? "" : this.Record.Comment),
                        $("#selectNewMemberGender").val(this.Record.Gender == null ? "" : this.Record.Gender.trim()),
                        $("#textboxNationality").val(this.Record.Nationality == null ? "" : this.Record.Nationality),
                        $("#textboxMaritalStatus").val(this.Record.MaritalStatus == null ? "" : this.Record.MaritalStatus),
                        $("#selectMembershipType").val(this.Record.MembershipType == null ? "" : this.Record.MembershipType == "Mem" ? "Member" : "Non-Member"),
                        document.getElementById("buttonSubmitUpdateMember").MemberID = this.Record.MemberID; //show update button

                    $rab.Membership.Modal(true)

                }


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

                    document.getElementById("checkCommunicant").checked = false;
                    document.getElementById("checkIsWaterBaptised").checked = false;
                    document.getElementById("checkIsHolySpiritBaptised").checked = false;

                    //$("#checkCommunicant").checked = false;       
                    //$("#checkIsWaterBaptised").checked = false;   
                    //$("#checkIsHolySpiritBaptised").checked = false;
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
        //new $rab.Security.LockDown().PagePermission($rab.Membership.Permissionset);
        $rab.LoadBranches("selectBranchNames");
        //setTimeout($rab.Security.Church.LoadBranches("selectchurchBranch"),3000);
        // setTimeout(new $rab.AuditTrail().PageVisited("Membership List"), 1000);
    } catch (e) {
        alert(e.message);
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

            IsCommunicant                  : document.getElementById("checkCommunicant").checked == true ? "Yes" : "No",
            IsWaterBaptised                : document.getElementById("checkIsWaterBaptised").checked == true ? "Yes" : "No",
            IsHolySpiritBaptised           : document.getElementById("checkIsHolySpiritBaptised").checked == true ? "Yes" : "No",
            IsBornAgain                    : document.getElementById("checkIsBornAgain").checked == true ? "Yes" : "No",

           
            IsNewConvertWaterBaptised      : document.getElementById("checkIsNewConvertWaterBaptised").checked == true ? "Yes" : "No",
            IsOldMemberHolySpiritBaptised  : document.getElementById("checkIsOldMemberHolySpiritBaptised").checked == true ? "Yes" : "No",
            DateCommunicant                : document.getElementById("textboxIsCommunicant"                  ).value,
            DateWaterBaptised              : document.getElementById("textboxIsWaterBaptised"              )  .value,
            DateHolySpiritBaptised         : document.getElementById("textboxIsHolySpiritBaptised"         )  .value,
            DateNewConvertWaterBaptised    : document.getElementById("textboxIsNewConvertWaterBaptised")      .value,
            DateOldMemberHolySpiritBaptised: document.getElementById("textboxIsOldMemberHolySpiritBaptised")  .value,

            DateBornAgain                  : document.getElementById("textboxcheckIsBornAgain").value,

            CreatedBy: 1000

        };

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
        document.getElementById("buttonSubmitUpdateMember").MemberID = person.MemberID;
        $("#selectNewMemberTitle").val(person.Title == null ? "" : person.Title.trim());
        $("#textboxProfession").val(person.Profession == null ? "" : person.Profession);
        $("#textboxNewMemberFirstName").val(person.FirstName == null ? "" : person.FirstName);
        $("#textboxNewMemberLastName").val(person.LastName == null ? "" : person.LastName);
        $("#textboxNewMemberAddressLineone").val(person.AddressLineone == null ? "" : person.AddressLineone);
        $("#textboxNewMemberAddressLinetwo").val(person.Addresslinetwo == null ? "" : person.Addresslinetwo);
        $("#textboxNewMemberPostcode").val(person.PostCode == null ? "" : person.PostCode);
        $("#textboxNewMemberTown").val(person.Town == null ? "" : person.Town);
        $("#textboxNewMemberEmail").val(person.EmailAddress == null ? "" : person.EmailAddress);
        $("#textboxNewMemberDOB").val(person.DOB == null ? "" : person.DOB);
        $("#selectNewMemberCountry").val(person.Country == null ? "" : person.Country);
        $("#textboxNewMemberTelephone").val(person.Telephone == null ? "" : person.Telephone);
        $("#selectNewMemberAgeCategory").val(person.AgeCategory == null ? "" : person.AgeCategory);
        $("#textboxNewMemberComment").val(person.Comment == null ? "" : person.Comment);
        $("#selectNewMemberGender").val(person.Gender == null ? "" : person.Gender.trim());
        $("#textboxNationality").val(person.Nationality == null ? "" : person.Nationality);
        $("#textboxMaritalStatus").val(person.MaritalStatus == null ? "" : person.MaritalStatus);
        $("#selectMembershipType").val(person.MembershipType == null ? "" : person.MembershipType);



        //fill baptism information in checkboxes
        if (person.BapInfo.IsCommunicant !="null") {
              document.getElementById("checkCommunicant").checked = (person.BapInfo.IsCommunicant == "Yes") ? true : false;
              document.getElementById("checkIsWaterBaptised").checked = (person.BapInfo.IsWaterBaptised == "Yes") ? true : false;
              document.getElementById("checkIsHolySpiritBaptised").checked = (person.BapInfo.IsHolySpiritBaptised == "Yes") ? true : false;

              document.getElementById("checkIsNewConvertWaterBaptised")   .checked  = (person.BapInfo.IsNewConvertWaterBaptised     == "Yes") ? true : false;
              document.getElementById("checkIsOldMemberHolySpiritBaptised").checked = (person.BapInfo.IsOldMemberHolySpiritBaptised == "Yes") ? true : false;
              document.getElementById("checkIsBornAgain")                  .checked = (person.BapInfo.IsBornagain == "Yes") ? true : false;
              $("#textboxIsCommunicant                 ").val(person.BapInfo.RHFDate                         == null ? "" : person.BapInfo.RHFDate                        );
              $("#textboxIsWaterBaptised               ").val(person.BapInfo.DateofBaptism                   == null ? "" : person.BapInfo.DateofBaptism                  );
              $("#textboxIsHolySpiritBaptised          ").val(person.BapInfo.HolySpiritBaptisedDate          == null ? "" : person.BapInfo.HolySpiritBaptisedDate         );
              $("#textboxIsNewConvertWaterBaptised     ").val(person.BapInfo.DateNewConvertWaterBaptised     == null ? "" : person.BapInfo.DateNewConvertWaterBaptised    );
              $("#textboxIsOldMemberHolySpiritBaptised ").val(person.BapInfo.DateOldMemberHolySpiritBaptised == null ? "" : person.BapInfo.DateOldMemberHolySpiritBaptised);
              $("#textboxcheckIsBornAgain              ").val(person.BapInfo.DateBornagain == null ? "" : person.BapInfo.DateBornagain);
              
              
        }
        else {
            alert("No info on Baptism");
        }
       

        // show update button
    } catch (e) {
        //alert(e.message);
    }

}
$rab.LoadBranches = function (dropdown) {
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