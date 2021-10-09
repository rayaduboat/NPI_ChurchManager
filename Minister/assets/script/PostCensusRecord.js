$('#btnPostCensus').on("click", function () {
    AdminJson();
    //alert("Great");
});

function AdminJson() {
    try {
        var myDataCollection = new collectCensusData();
        var myJsonArge = new JsonArge();
        myJsonArge.data = JSON.stringify(myDataCollection);
        $.ajax(myJsonArge)
    } catch (e) {

    }

}


function JsonArge() {

    $.ajax({
            Type : 'POST',
            url : 'Census.aspx/PostRecord',
            data : '{"data":"123"}',
            dataType : 'JSON',
            contentType : 'application/json; charset:utf-8',
            success: function (response) {
                alert("Pass");
            }
    });
   
}

function collectCensusData() {
    this.lblDate = $('#lblDate').val();
    this.selectBranchName = $('#selectBranchName').val();
    this.textBoxMenCount = $('#textBoxMenCount').val();
    this.textBoxWomenCount = $('#textBoxWomenCount').val();
    this.textBoxChildrenCount = $('#textBoxChildrenCount').val();
    this.textBoxSermonSpeaker = $('#textBoxSermonSpeaker').val();
    this.textBoxBibleStudyTopic = $('#textBoxBibleStudyTopic').val();
    this.textBoxKeyInformation = $('#textBoxKeyInformation').val();
    this.textBoxMidWeek = $('#textBoxMidWeek').val();
    this.textBoxMissionaryOffering = $('#textBoxMissionaryOffering').val();
    this.textBoxNewMembers = $('#textBoxNewMembers').val();
    this.textBoxOther = $('#textBoxOther').val();
    this.textBoxSermonSummary = $('#textBoxSermonSummary').val();
    this.textBoxSermonTitle = $('#textBoxSermonTitle').val();
    this.textBoxSpecify = $('#textBoxSpecify').val();
    this.textBoxTithes = $('#textBoxTithes').val();
    this.textBoxAbsentTwoWeeks = $('#textBoxAbsentTwoWeeks').val();
}