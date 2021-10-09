$(function () {
    $("#btnUpdate").css("display","none");
    $("#buttonDateSearch").click(function () {
        ClearEnteredData();
        var searchDate = $("#textBoxDateSearch").val();
        $("#btnPostReport").attr("disabled", "disabled");
        try
        {
            if (searchDate.trim().length==0)throw new DOMException("Please provide search date");
                
            var post = { searchDate: searchDate, branchName: $("#selectsearchbranch").val() };
            var data = JSON.stringify(post);
            $.ajax({
                type: 'POST',
                url: 'WeeklyActivities.aspx/GetWeekDateActivitiesByBranch',
                data: data,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (res) {
                    var res = JSON.parse(res.d);
                    $("#btnUpdate").css("display", "block");

                     $('#recordID')                 .val(res.Id);
                     $('#lblDate')                  .val(res.ActivityDate                  );
                     $('#selectBranchName')         .val(res.SelectBranchName         );
                     $('#textBoxMenCount')          .val(res.MenCount          );
                     $('#textBoxWomenCount')        .val(res.WomenCount        );
                     $('#textBoxChildrenCount')     .val(res.ChildrenCount     );
                     $('#textBoxSermonSpeaker')     .val(res.SermonSpeaker     );
                     $('#textBoxBibleStudyTopic')   .val(res.BibleStudyTopic   );
                     $('#textBoxKeyInformation')    .val(res.KeyInformation    );
                     $('#textBoxMidWeek')           .val(res.MidWeek           );
                     $('#textBoxMissionaryOffering').val(res.MissionaryOffering);
                     $('#textBoxNewMembers')        .val(res.NewMembers        );
                     $('#textBoxOther')             .val(res.Other             );
                     $('#textBoxSermonSummary')     .val(res.SermonSummary     );
                     $('#textBoxSermonTitle')       .val(res.SermonTitle       );
                     $('#textBoxSpecify')           .val(res.Specify           );
                     $('#textBoxTithes')            .val(res.Tithes            );
                     $('#textBoxAbsentTwoWeeks')    .val(res.AbsentTwoWeeks    );
                },
                error: function (e) {
                    alert("failed to get a date match");
                }

            });
             
        } catch (e) {
            alert(e.message);
        }
    });
})