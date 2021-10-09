$rab.Search = $rab.Search || {};
$rab.Search.Permissionset = ["All", "SuperUser", "Advanced search"];

$(function () {
    try {
        new $rab.Security.LockDown().PagePermission($rab.Search.Permissionset);
        new $rab.AuditTrail().PageVisited("Advanced search")
    } catch (e) {

    }
})
$rab.Search = function () {
    this.Members = function (record) {
        //var record = this.record;
        //check person area of administration before allowing them to see member details
        if ($rab.Login.User.LoginType == "SuperUser") {
            this.Load(record);
            return;
        }
        //if selected member is in adminstrative region then load
        if ($rab.Login.User.AssignedBranchGroups.length > 0) {
            var result = $rab.Login.User.AssignedBranchGroups.filter(function (val) {
                return val.BranchID == record.BranchID
            })
            //if match found, load details
            if (result.length > 0) {
                this.Load(record);
                return;
            }
        }
        //if is a local search the load
        if ($rab.Login.User.BranchID == record.BranchID) {
            this.Load(record);
            return;
        }
        //if you got here then you dont have permission to view user details;
        alert('Member not in your area of administration./nAccess denied');
    }
    this.Filter = function (jsonstring, filterName, value) {
        try {
            //alert(filterName);
            //alert(jsonstring);
            tbody = document.getElementById("tbodysSearchResult");
            //dont filter header 
            if (tbody.rows.length>0) {
                for (var i = 1; i < tbody.rows.length; i++) {
                    //look through column and hide all non-inclusive rows
                    var firstNameText = tbody.rows[i].cells[2].innerText;
                    var lastNameText = tbody.rows[i].cells[3].innerText;
                    var areaText = tbody.rows[i].cells[4].innerText;
                    var districtText = tbody.rows[i].cells[5].innerText;
                    //get column name and filter by hiding all non matching text
                    if (value == filterName) {
                        $(tbody.rows[i]).show();
                    }
                    else if (filterName == 'FirstName' && value != firstNameText) {
                        //hide row 
                        $(tbody.rows[i]).hide();
                    }
                    else if (filterName == 'LastName' && value != lastNameText) {
                        //show row 
                        $(tbody.rows[i]).hide();
                    }
                    else if (filterName == 'Area' && value != areaText) {
                        //show row 
                        $(tbody.rows[i]).hide();
                    }
                    else if (filterName == 'District' && value != districtText) {
                        //show row 
                        $(tbody.rows[i]).hide();
                    }
                    else {
                        //do nothing a match is found
                        $(tbody.rows[i]).show();
                    }
                }
            }
            
             
        } catch (e) {

        }
    }
    this.Load = function (record) {
        try {
            if (typeof record == null)
                throw new $rab.Exception("invalid record")
            $.ajax({
                type: "POST",
                url: 'MembershipList.aspx/GetMemberByID',
                data: JSON.stringify({ memberID: record.MemberID }),
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //build member record and show modal
                    $('button[data-target="#matchMember"]').click();
                    var tbody = document.getElementById('tbodyMember');
                    $(tbody).empty();
                    var item = data.d;
                    tbody.insertRow(0); tbody.rows[0].insertCell(0).innerHTML = "AreaID ";
                    tbody.rows[0].insertCell(1).innerHTML = item.AreaID
                    tbody.insertRow(1); tbody.rows[1].insertCell(0).innerHTML = "DistrictID      "
                    tbody.rows[1].insertCell(1).innerHTML = item.DistrictID
                    tbody.insertRow(2); tbody.rows[2].insertCell(0).innerHTML = "BranchID        "
                    tbody.rows[2].insertCell(1).innerHTML = item.BranchID
                    tbody.insertRow(3); tbody.rows[3].insertCell(0).innerHTML = "LoginType       "
                    tbody.rows[3].insertCell(1).innerHTML = item.LoginType
                    tbody.insertRow(4); tbody.rows[4].insertCell(0).innerHTML = "MemberID        "
                    tbody.rows[4].insertCell(1).innerHTML = item.MemberID
                    tbody.insertRow(5); tbody.rows[5].insertCell(0).innerHTML = "Title           "
                    tbody.rows[5].insertCell(1).innerHTML = item.Title
                    tbody.insertRow(6); tbody.rows[6].insertCell(0).innerHTML = "FirstName       "
                    tbody.rows[6].insertCell(1).innerHTML = item.FirstName
                    tbody.insertRow(7); tbody.rows[7].insertCell(0).innerHTML = "LastName        "
                    tbody.rows[7].insertCell(1).innerHTML = item.LastName
                    tbody.insertRow(8); tbody.rows[8].insertCell(0).innerHTML = "BranchId        "
                    tbody.rows[8].insertCell(1).innerHTML = item.BranchId
                    tbody.insertRow(9); tbody.rows[9].insertCell(0).innerHTML = "DOB             "
                    tbody.rows[9].insertCell(1).innerHTML = item.DOB
                    tbody.insertRow(10); tbody.rows[10].insertCell(0).innerHTML = "AddressLineOne  "
                    tbody.rows[10].insertCell(1).innerHTML = item.AddressLineOne
                    tbody.insertRow(11); tbody.rows[11].insertCell(0).innerHTML = "AddressLineTwo "
                    tbody.rows[11].insertCell(1).innerHTML = item.AddressLineTwo
                    tbody.insertRow(12); tbody.rows[12].insertCell(0).innerHTML = "PostCode    "
                    tbody.rows[12].insertCell(1).innerHTML = item.PostCode
                    tbody.insertRow(13); tbody.rows[13].insertCell(0).innerHTML = "Country         "
                    tbody.rows[13].insertCell(1).innerHTML = item.Country
                    tbody.insertRow(14); tbody.rows[14].insertCell(0).innerHTML = "MembershipType  "
                    tbody.rows[14].insertCell(1).innerHTML = item.MembershipType
                    tbody.insertRow(15); tbody.rows[15].insertCell(0).innerHTML = "Telephone       "
                    tbody.rows[15].insertCell(1).innerHTML = item.Telephone
                    tbody.insertRow(16); tbody.rows[16].insertCell(0).innerHTML = "Telephone        "
                    tbody.rows[16].insertCell(1).innerHTML = item.Telephone
                    tbody.insertRow(17); tbody.rows[17].insertCell(0).innerHTML = "EmailAddress    "
                    tbody.rows[17].insertCell(1).innerHTML = item.EmailAddress
                    tbody.insertRow(18); tbody.rows[18].insertCell(0).innerHTML = "BranchName      "
                    tbody.rows[18].insertCell(1).innerHTML = item.BranchName
                    tbody.insertRow(19); tbody.rows[19].insertCell(0).innerHTML = "Permissionset   "
                    tbody.rows[19].insertCell(1).innerHTML = item.Permissionset
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        } catch (e) {
            alert(e.message);
        }
    }
}
