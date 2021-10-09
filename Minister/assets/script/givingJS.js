
$rab.Giving = function () {
    this.obj = {
        id: $("#labelgivingID").html(),
        date: $("#textboxDonationDate").val(),
        fund: $("#selectFund").val(),
        method: $("#selectMethod").val(),
        amount: $("#txtDonatedAmount").val(),
        giftaidid: document.getElementById("spanGiftAiderID").Giver.GiftAidID,
        memberid: document.getElementById("spanGiftAiderID").Giver.MemberID,
        createdby: $rab.Login.User.MemberID,
        branchID:new $rab.Branch().BranchInfo.BranchID,
    }
    this.IsInputsValid = function () {
        if (this.obj.date == null     || this.obj.date.toString().length == 0 || new Date(this.obj.date).toLocaleDateString() == "Invalid Date") { alert('invalid date'); return false; }
        if (this.obj.amount == null   || this.obj.amount.toString().length == 0 || parseFloat(this.obj.amount) <= 0) { alert('invalid amount'); return false; }
        if (this.obj.fund == null     || this.obj.fund == "Select fund") { alert('select a fund'); return false; }
        if (this.obj.method == null   || this.obj.method == "Select method") { alert('select a method'); return false; }
        if (this.obj.branchID == null || this.obj.branchID.toString().length == 0 || parseInt(this.obj.branchID) <= 0) { alert('failed to get branch id'); return false; }

        return true;

    }
    this.Add = function () {
        try {
            if (!this.IsInputsValid()) return;

            var action= document.getElementById("buttonsavegiving").innerHTML;
            if (action == 'Update') {
                try {
                    this.Update();
                } catch (e) {
        
                }

            }
            else if (action == 'save') {

                var url = "Giving.aspx/AddGiving";
                var date = this.obj.date;
                var fund = this.obj.fund;
                var method = this.obj.method;
                var amount = this.obj.amount;
                var obj = this.obj;
                new $rab.Server.Method().BeginInvoke(url, { giver: obj }, this.BuildTable);
            }


        } catch (e) {
            alert(e.message);
        }
    }
    this.Update = function () {
       
        var date = this.obj.date;
        var fund = this.obj.fund;
        var method = this.obj.method;
        var amount = this.obj.amount;
        var obj = this.obj;
        var url = "Giving.aspx/UpdateGiving";
        new $rab.Server.Method().BeginInvoke(url, { giver: obj }, this.BuildTable);
    }
    this.BuildTable = function (data) {
        $("#tbodyMembersdata").empty();
        $rab.GiftAid.LoadGivings(data);return
        //data : data is an array
      

        }
    
}
$(function () {
    document.getElementById("defaultOpen").click();

})
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}