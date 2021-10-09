
function AdminJson() {
    try {
        var myDataCollection = new collectCensusData();
        //var myJsonArge = new JsonArge();
        //myJsonArge.data = JSON.stringify(myDataCollection);
        $.ajax({
            type: 'POST',
            url: 'Census.aspx/PostRecord',
            data: JSON.stringify(myDataCollection),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                alert(response.d);

               $('#textBoxAssemblyName').val("");
                $('#textBoxTitle').val("");
                 $('#textBoxFirstName').val("");
                $('#textBoxSurname').val("");
                 $('#textBoxMiddleName').val("");
                 $('#textBoxTelephone').val("");
                 $('#textBoxMobileNumber').val("");
                 $('#textBoxMaritalStatus').val("");
                 $('#textBoxContactPerson').val("");
                 $('#textBoxProfession').val("");
                 $('#textBoxActiveArea').val("");
                 $('#textBoxOccupation').val("");
                 $('#textBoxHasBornAgain').val("");
                 $('#textBoxDateBornAgain').val("");
                 $('#textBoxHasWaterBaptised').val("");
                 $('#textBoxDateWaterBaptised').val("");
                $('#textBoxHasHolyGhostBaptised').val("");
                $('#textBoxDateHolyGhostBaptised').val("");
                 $('#textBoxPreviousChurch').val("");
                 $('#textBoxDateFirstVisit').val("");
                 $('#textBoxChurchContactPerson').val("");
                $('#textBoxUrgentPrayerRequest').val("");
                 $('#textBoxPrayerRequestDetails').val("");

            },
            error: function (e) {
                alert(e.responseText);
            }


        });
    } catch (e) {

    }

}


function collectCensusData() {
    //this.Id                     =$('#').val();
    this.AssemblyName = $('#textBoxAssemblyName').val();
    this.Title = $('#textBoxTitle').val();
    this.FirstName = $('#textBoxFirstName').val();
    this.Surname = $('#textBoxSurname').val();
    this.MiddleName = $('#textBoxMiddleName').val();
    this.Telephone = $('#textBoxTelephone').val();
    this.MobileNumber = $('#textBoxMobileNumber').val();
    this.MaritalStatus = $('#textBoxMaritalStatus').val();
    this.ContactPerson = $('#textBoxContactPerson').val();
    this.Profession = $('#textBoxProfession').val();
    this.ActiveArea = $('#textBoxActiveArea').val();
    this.Occupation = $('#textBoxOccupation').val();
    this.HasBornAgain = $('#textBoxHasBornAgain').val();
    this.DateBornAgain = $('#textBoxDateBornAgain').val();
    this.HasWaterBaptised = $('#textBoxHasWaterBaptised').val();
    this.DateWaterBaptised = $('#textBoxDateWaterBaptised').val();
    this.HasHolyGhostBaptised = $('#textBoxHasHolyGhostBaptised').val();
    this.DateHolyGhostBaptised = $('#textBoxDateHolyGhostBaptised').val();
    this.PreviousChurch = $('#textBoxPreviousChurch').val();
    this.DateFirstVisit = $('#textBoxDateFirstVisit').val();
    this.ChurchContactPerson = $('#textBoxChurchContactPerson').val();
    this.UrgentPrayerRequest = $('#textBoxUrgentPrayerRequest').val();
    this.PrayerRequestDetails = $('#textBoxPrayerRequestDetails').val();

}