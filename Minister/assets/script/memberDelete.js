$rab.update = $rab.update || {}
$rab.update = function () {
    this.buildTable = function (jsondata) {
        try {
           
            var tbody = document.getElementById("tbodyMembersToDelete");
            var parsed = JSON.parse(jsondata);
            for (var i = 0; i < parsed.length; i++) {
                tbody.insertRow(i);
                tbody.rows[i].insertCell(0).innerHTML = parsed[i].MemberID;
                tbody.rows[i].insertCell(1).innerHTML = parsed[i].LastName;
                tbody.rows[i].insertCell(2).innerHTML = parsed[i].FirstName;
                tbody.rows[i].insertCell(3).innerHTML = parsed[i].Type;
                var td = tbody.rows[i].insertCell(4);
                var button = document.createElement("button");
                button.innerHTML = "delete";
                button.style.backgroundColor = "red";
                button.style.color = "white";
                button.record = parsed[i];
                button.tr = tbody.rows[i];
                button.onclick = function () {
                    if (confirm("Delete member "+this.record.LastName+" "+this.record.FirstName+"??")) {

                   
                    try {
                        var url, obj, handler
                        url = 'MembershipList.aspx/DeleteMember';
                        obj = {
                            branchid: this.record.BranchID,
                            memberid: this.record.MemberID,
                        };
                        var tr = this.tr;
                        new $rab.Server.Method().BeginInvoke(url, obj, function (jsondata) {
                           // alert(jsondata);
                            if (jsondata == "Member Deleted successfully!") {
                                $(tr).remove();
                            }
                        });

                    } catch (e) {

                        }
                    }
                }
                td.appendChild(button);
            }
        } catch (e) {

        }
    }
    this.getMembers = function () {
        $("#tbodyMembersToDelete").empty();
        var url, obj, handler
        url = 'MembershipList.aspx/GetAllMembers';
        obj = { branchName: $("#selectLoadBranchNames").val() };
        
        new $rab.Server.Method().BeginInvoke(url, obj, new $rab.update().buildTable);

    }
    this.delete = function () {
        try {

        } catch (e) {

        }
    }

}