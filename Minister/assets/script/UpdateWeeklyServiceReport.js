$(function () {
    $("#btnUpdate").click(function () {
       
        var post = new collectData();
        $.ajax({
            type: 'POST',
            url: 'WeeklyActivities.aspx/UpdatetWeeklyActivities',
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
})