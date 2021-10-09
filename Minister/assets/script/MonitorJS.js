var $mon = $mon || {};
$mon.Attendance = $mon.Attendance || {};
$mon.Server = $mon.Server || {};
$mon.Attendance.List = function () {
    this.districtList = function () {

    }
}
$mon.Attendance.Activities = function () {
    this.getList = function (dropdown) {
     
        var pr = new $mon.Server.Initializers();
        pr.url = "AttendantsMonitor.aspx/getActivities";
        pr.obj = {};
       
        pr.handler = function (jsondata) {
            try {
                if (jsondata == "undefined") new $mon.Exception(jsondata);
                var data = JSON.parse(jsondata);
                $("#" + dropdown).empty();
                new $mon.Utilities.FillOptions(["Select Activity"], dropdown);
                for (var i = 0; i < data.Results.length; i++) {
                    var option = document.createElement("option");
                    option.value = data.Results[i].ActivityName;
                    option.innerHTML = data.Results[i].ActivityName;
                    document.getElementById(dropdown).appendChild(option);
                }
            } catch (e) {

            }
            
        }
pr.invoke();
    }
    this.rollCall = function (activitySelected, levelCount) {
        var myUrl;
        var areacount = 0;
        var districtcount = 0;
        var arealist = [];
        var districtlist = [];
        var lv = $("#" + levelCount).val();
        var act = $("#" + activitySelected).val();
        var pr = new $mon.Server.Initializers();

        switch (lv) {
            case "Area":
                myUrl = "AttendantsMonitor.aspx/getAreaAttendance";
                break;
            case "District":
                myUrl = "AttendantsMonitor.aspx/getDistrictAttendance";
                break;

            case "Local":
                myUrl = "AttendantsMonitor.aspx/getLocalAttendance";
                break;
            default:
        }
        pr.url = myUrl;//"Default.aspx/getAttendance";
        pr.obj = { activity: $("#" + activitySelected).val(), levelcount: $("#" + levelCount).val() };
        pr.handler = function (jsondata) {
            var data = JSON.parse(jsondata);
            $('#divMain').addClass("showMe");


            if (lv.trim() == "Area") {
                $('#tabLocal').empty();
                $('#divLocal').removeClass("showMe");
                $('#divLocal').addClass("hideMe");
                $('#tabDistrict').empty();
                $('#divDistrict').removeClass("showMe");
                $('#divDistrict').addClass("hideMe");
                $('#divArea').addClass("showMe");
                $('#tabArea').empty();
                $('#tabArea').addClass("w3-table w3-striped w3-border");
                // alert(data.Results[0].AreaName);
                for (var i = 0; i < data.Results.length; i++) {
                    var tr = document.createElement("tr");
                    var tdAreaName = document.createElement("td"); tdAreaName.innerHTML = data.Results[i].AreaName;
                    var tdAreaCount = document.createElement("td"); tdAreaCount.innerHTML = data.Results[i].AreaCount;
                    //tdAreaName.id = "countTd"
                    //document.getElementById("countTd").addClass("dtCls");
                    //document.getElementsByName(tdAreaCount).addClass("dtCls");
                    //tr.addClass("w3-light-grey");
                    tr.appendChild(tdAreaName);
                    tr.appendChild(tdAreaCount);

                    document.getElementById("tabArea").appendChild(tr);

                }
            }

            if (lv.trim() == "District") {
                $('#tabLocal').empty();
                $('#divLocal').removeClass("showMe");
                $('#divLocal').addClass("hideMe");
                $('#tabArea').empty();
                $('#divArea').removeClass("showMe");
                $('#divArea').addClass("hideMe");
                $('#divDistrict').addClass("showMe");
                $('#tabDistrict').empty();
                $('#tabDistrict').addClass("w3-table w3-striped w3-border");
                // alert(data.Results[0].AreaName);
                for (var i = 0; i < data.Results.length; i++) {
                    var tr = document.createElement("tr");
                    var tdDistrictName = document.createElement("td"); tdDistrictName.innerHTML = data.Results[i].DistrictName;
                    var tdDistrictCount = document.createElement("td"); tdDistrictCount.innerHTML = data.Results[i].DistrictCount;
                    //tr.addClass("w3-light-grey");
                    tr.appendChild(tdDistrictName);
                    tr.appendChild(tdDistrictCount);

                    document.getElementById("tabDistrict").appendChild(tr);

                }
            }

            if (lv.trim() == "Local") {
                $('#tabArea').empty();
                $('#divArea').removeClass("showMe");
                $('#divArea').addClass("hideMe");
                
                $('#tabDistrict').empty();
                $('#divDistrict').removeClass("showMe");
                $('#divDistrict').addClass("hideMe");
                $('#divLocal').addClass("showMe");
                $('#tabLocal').empty();
                $('#tabLocal').addClass("w3-table w3-striped w3-border");
                // alert(data.Results[0].AreaName);
                for (var i = 0; i < data.Results.length; i++) {
                    var tr = document.createElement("tr");
                    var tdLocalName = document.createElement("td"); tdLocalName.innerHTML = data.Results[i].BranchName;
                    var tdLocalCount = document.createElement("td"); tdLocalCount.innerHTML = data.Results[i].BranchCount;
                    //tr.addClass("w3-light-grey");
                    tr.appendChild(tdLocalName);
                    tr.appendChild(tdLocalCount);

                    document.getElementById("tabLocal").appendChild(tr);

                }
            }

        }
        pr.invoke();
    }
}
$mon.Server.Initializers = function () {
    this.url = "";
    this.obj = "";
    this.handler = "";
    this.invoke = function () {
        new $mon.Server.Method().BeginInvoke(this.url, this.obj, this.handler)
    }
}
$mon.Server.Method = function () {
    this.BeginInvoke = function (url, obj, handler) {
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                handler(msg.d);
            },
            error: function (e) {
                //alert(e.responseText);
            }
        });
    }
    this.BeginInvokeAll = function (url, obj, handlers) {
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                // Invoke all the methods passed.
                for (var i = 0; i < handlers.length; i++) {
                    handler(i)();
                }


            },
            error: function (e) {
                alert(e.responseText);
            }
        });
    }
}
$mon.Exception = function (message) { this.message = alert(message); return false; }
$mon.Attendance.FillOptions = function (filter, element) {

    if (filter === null) return false;
    var array = [];
    for (var i = 0; i < filter.length; i++) {
        var option = document.createElement("option");
        if (array.indexOf(filter[i]) == -1) {
            option.value = filter[i];
            option.innerHTML = filter[i];
            document.getElementById(element).appendChild(option);
            array.push(filter[i]);
        }
    }

};
$mon.Attendance.DateToday = function () {
    this.fullDate = function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }

        today = mm + '/' + dd + '/' + yyyy;
        document.write(today);
        return today;
    }
    this.YearOfDate = function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var year = today.getFullYear();
        return year;
    }
    this.MonthOfDate = function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var year = today.getFullYear();
        return mm;
    }
    this.DayOfDate = function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var year = today.getFullYear();
        return dd;
    }
}



