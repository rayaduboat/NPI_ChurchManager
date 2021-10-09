$(function () {
    $('#btnPostReport').on("click", function () {
        var post = new collectData();
        $.ajax({
            type: 'POST',
            url: 'WeeklyActivities.aspx/PostWeeklyActivities',
            data: JSON.stringify(post),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (response) {
                alert(response.d);
            },
            error: function (e) {
                alert(e.responseText);
            }

        });


    });
});
function collectData() {
    this.RecordId = $('#recordID').val()
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
function ClearEnteredData() {
       // $("input[type='text']","select").val("")
        $('#recordID').val('')
        $('#lblDate').val('');
        $('#selectBranchName').val('');
        $('#textBoxMenCount').val('');
        $('#textBoxWomenCount').val('');
        $('#textBoxChildrenCount').val('');
        $('#textBoxSermonSpeaker').val('');
        $('#textBoxBibleStudyTopic').val('');
        $('#textBoxKeyInformation').val('');
        $('#textBoxMidWeek').val('');
        $('#textBoxMissionaryOffering').val('');
        $('#textBoxNewMembers').val('');
        $('#textBoxOther').val('');
        $('#textBoxSermonSummary').val('');
        $('#textBoxSermonTitle').val('');
        $('#textBoxSpecify').val('');
        $('#textBoxTithes').val('');
        $('#textBoxAbsentTwoWeeks').val('');
        }