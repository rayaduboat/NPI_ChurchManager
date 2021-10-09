$rab.cellgroups = $rab.cellgroups || {};
$rab.cellgroups = function () {
     
    this.build = function () {
        try {
            if ($rab.Membership.Temp == null || $rab.Membership.Temp.length==0) throw new Error("Please load member in membership panel before loading members");

            //if you get here then membership has been loaded
            // get all the entered group names
            //get data from data
            var url, obj;
            obj = {
                pageName: "Membership",
                filterName: "CellGroupName"
            }
            url = "Accounts.aspx/GetDictionary";
            new $rab.Server.Method().BeginInvoke(url, obj,
                function (array) {
                    try {
                        if (array == null) { throw new Error("Failed to read group names"); return; }
                        if (array.length == 0) {
                            throw new Error("Oops, there are not cell group names setup. please create cell groups before continuing."); return;
                        }

                        var members = $rab.Membership.Temp;
                        var tbody = document.getElementById("tbodycellgroups");
                        $(tbody).empty();
                        for (var i = 0; i < members.length; i++) {
                            try {
                                tbody.insertRow(i);
                                tbody.rows[i].insertCell(0).innerHTML  = members[i].MemberID;
                                tbody.rows[i].insertCell(1).innerHTML  = members[i].FirstName;
                                tbody.rows[i].insertCell(2).innerHTML  = members[i].LastName;

                                var textboxRoles           = GetRoles();
                                var textboxMeetingLocation = GetMeetingLocation();
                                var selectGroupName        = GetGroupName(array);
                                var textboxMeetingDay      = GetMeetingDay();
                                var textboxMeetingTime     = GetMeetingTime();
                                var textboxDateJoined      = GetDateJoined();
                                var selectActiveStatus     = GetActiveNessStatus();
                                var buttonSubmit = GetSubmitAction();

                                buttonSubmit.branchID               = new $rab.Branch().BranchInfo.BranchID;
                                buttonSubmit.memberID               = members[i].MemberID;
                                buttonSubmit.textboxRoles           =textboxRoles          ;
                                buttonSubmit.textboxMeetingLocation =textboxMeetingLocation;
                                buttonSubmit.selectGroupName        =selectGroupName       ;
                                buttonSubmit.textboxMeetingDay      =textboxMeetingDay     ;
                                buttonSubmit.textboxMeetingTime     =textboxMeetingTime    ;
                                buttonSubmit.textboxDateJoined      =textboxDateJoined     ;
                                buttonSubmit.selectActiveStatus     =selectActiveStatus    ;
                                
                                tbody.rows[i].insertCell(3) .appendChild(  selectGroupName        )
                                tbody.rows[i].insertCell(4) .appendChild(textboxMeetingLocation)
                                tbody.rows[i].insertCell(5) .appendChild(textboxRoles       )
                                tbody.rows[i].insertCell(6) .appendChild(textboxMeetingDay     )
                                tbody.rows[i].insertCell(7) .appendChild(textboxMeetingTime    )
                                tbody.rows[i].insertCell(8) .appendChild(textboxDateJoined     )
                                tbody.rows[i].insertCell(9) .appendChild(selectActiveStatus    )
                                tbody.rows[i].insertCell(10).appendChild(buttonSubmit          )

                                buttonSubmit.onclick = new $rab.cellgroups().add;                 

                            } catch (e) {

                            }
                        }
                    } catch (e) {
                        alert(e.message);
                    }
                    function GetRoles() {

                        //return select element with leader and assistant role
                        var select = document.createElement("select");
                        var option = document.createElement("option");
                        var option2 = document.createElement("option");
                        var option3 = document.createElement("option");
                        var option4 = document.createElement("option");
                        select.appendChild(option);
                        select.appendChild(option2);
                        select.appendChild(option3);
                        select.appendChild(option4);
                        option.value = "Select role"; option.innerHTML = "Select role";
                        option2.value = "Leader"; option2.innerHTML = "Select role";
                        option3.value = "Assistant leader"; option3.innerHTML = "Assistant leader";
                        option4.value = "Member"; option4.innerHTML = "Member";
                        option.selected = true;
                        return select;

                    };
                    function GetMeetingLocation() {
                        //return select element with leader and assistant role
                        var textbox = document.createElement("input");
                        textbox.type = "text";
                        textbox.placeholder="enter ..."
                        return textbox;
                    }
                    function GetGroupName(array) {
                        if (array != null && array.length > 0) {
                            var select = document.createElement("select");
                            var option = document.createElement("option");
                            select.appendChild(option); option.selected = true;
                            option.value = "Select group";
                            option.innerHTML = "Select group";
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
                    function GetMeetingDay() {
                        //return select element with leader and assistant role
                        //return select element with leader and assistant role
                        var select = document.createElement("select");
                        var option = document.createElement("option");
                        var option2 = document.createElement("option");
                        var option3 = document.createElement("option");
                        var option4 = document.createElement("option");
                        var option5 = document.createElement("option");
                        var option6 = document.createElement("option");
                        var option7 = document.createElement("option");
                        var option8 = document.createElement("option");


                        select.appendChild(option);
                        select.appendChild(option2);
                        select.appendChild(option3);
                        select.appendChild(option4);
                        select.appendChild(option5);
                        select.appendChild(option6);
                        select.appendChild(option7);
                        select.appendChild(option8);
                        option.value = "Select day"; option.innerHTML = "Select day";
                        option2.value = "Sunday";   option2.innerHTML    = "Sunday";
                        option3.value = "Monday";   option3.innerHTML    = "Monday";
                        option4.value = "Tuesday";  option4.innerHTML   = "Tuesday";
                        option5.value = "Wedneday"; option5.innerHTML  = "Wedneday";
                        option6.value = "Thursday"; option6.innerHTML  = "Thursday";
                        option7.value = "Friday";   option7.innerHTML    = "Friday";
                        option8.value = "Saturday"; option8.innerHTML  = "Tuesday";

                        option.selected = true;
                        return select;
                    }
                    function GetMeetingTime() {
                        //return select element with leader and assistant role
                        var textbox = document.createElement("input");
                        textbox.type = "text";
                        textbox.placeholder = "enter..."
                        return textbox;
                    }
                    function GetDateJoined() {
                        //return select element with leader and assistant role
                        var textbox = document.createElement("input");
                        textbox.type = "text";
                        textbox.placeholder = "enter .."
                        return textbox;
                    }
                    function GetActiveNessStatus() {
                        //return select element with leader and assistant role
                        var select = document.createElement("select");
                        var option = document.createElement("option");
                        var option2 = document.createElement("option");
                        var option3 = document.createElement("option");
                        
                        select.appendChild(option);
                        select.appendChild(option2);
                        select.appendChild(option3);
                        
                        option.value = "Select activeness"; option.innerHTML = "Select activeness";
                        option2.value = "Active"; option2.innerHTML = "Active";
                        option3.value = "Not active"; option3.innerHTML = "Not active";
                        
                        option.selected = true;
                        return select;

                    }
                    function GetSubmitAction() {
                        //return select element with leader and assistant role
                        var button = document.createElement("input");
                        button.type = "button";
                        button.value = "join cell"
                        return button;

                    }
                });
        } catch (e) {
            alert(e.message);
        }
    }
    this.add = function () {
        try {
            var obj = {
                branchID: this.branchID,
                memberID: this.memberID,
                role: this.textboxRoles.value,
                location: this.textboxMeetingLocation.value,
                groupname: $(this.selectGroupName).val(),
                meetingday: this.textboxMeetingDay.value,
                meetingtime: this.textboxMeetingTime.value,
                datejoined: this.textboxDateJoined.value,
                activeStatus: $(this.selectActiveStatus).val(),
                createdBy: $rab.Login.User.MemberID,
                createdOn:0
            }
            if (obj == null) return false;
            if (obj.memberID    == null) return false;
            if (obj.role        ==null ||obj.role        .toString().indexOf("Select") > -1) {obj.role        ="unknown"};
            if (obj.groupname   ==null ||obj.groupname   .toString().indexOf("Select") > -1) {obj.groupname   ="unknown"};
            if (obj.meetingday  ==null ||obj.meetingday  .toString().indexOf("Select") > -1) {obj.meetingday  ="unknown"};
            if (obj.activeStatus==null ||obj.activeStatus.toString().indexOf("Select") > -1) {obj.activeStatus="unknown"};

            var url = "MembershipList.aspx/CellGroupsAddMember";
            new $rab.Server.Method().BeginInvoke(url, { cellarg:obj }, function (jsondata) {
                try {
                    if (jsondata!=null && JSON.parse(jsondata).message=="success") {
                        alert("success");
                    } else {
                        alert(JSON.parse(jsondata).message);
                    }
                } catch (e) {

                }
            })
        } catch (e) {
            alert(e.message);
        }
    }
    this.isInputsValid = function (obj) {
        var isvalid = false;
        try {
           

            return true;
        } catch (e) {

        }
        return isvalid;
    }
    this.GetCellGroups = function () {
        try {
           
        } catch (e) {

        }
    }
    this.viewCellGroups = function (memberID) {
        try {
            if (true) {

            }
        } catch (e) {

        }
    }
}
