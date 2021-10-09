 $rab.ManagementList = $rab.ManagementList || {};
$rab.Reminder = function () {
    this.add = function () {
        //create reminders
        /*
         create a table row 
         insert row in reminder table
         insert text and update button for submitting
        */
        
        var tbody = document.getElementById('tbodyReminder');
        var row = tbody.insertRow(0);
        
        row.insertCell(0); row.insertCell(1); row.insertCell(2); row.insertCell(3)
        row.insertCell(4)
        row.cells[0].appendChild(document.createElement('textarea'));
        row.cells[1].appendChild(document.createElement('input'));
        row.cells[2].appendChild(document.createElement('label'));
        row.cells[3].appendChild(document.createElement('button'));
        row.cells[4].appendChild(document.createElement('button'));


        var btn = row.cells[3].firstChild; btn.innerHTML = "create";
        var btnremove = row.cells[4].firstChild; btnremove.innerHTML = "remove";

        var text = row.cells[0].firstChild; text.cols = 3; text.rows=3
        var textdate = row.cells[1].firstChild;
        var textuser = row.cells[2].firstChild;

        btnremove.row = row;
        textuser.innerHTML = $rab.Login.User.FirstName +" " +$rab.Login.User.LastName
        textdate.placeholder = 'dd/mm/yyyy';
        textdate.className = 'form-control';
        text.className = 'form-control';
        text.placeholder='enter reminder'
        text.onmouseleave = function () { this.title = this.text; }
        btnremove.onclick = function () { $(this.row).remove(); };
        //906294
        btn.text = text;
        btn.date = textdate;
        btn.onclick = function () {
            try {
                var inv = new $rab.Server.Dispatcher();
                inv.obj = {
                    message: this.text.value, date: this.date.value,
                    memberId:$rab.Login.User.MemberID, branchId:$rab.Login.User.BranchID
                };
                inv.url = 'ManagementList.aspx/AddReminder';
                inv.handler = new $rab.Reminder().getreminders
                inv.invoke();
            } catch (e) {

            }
        }

    }
    //remove reminders
    this.remove = function () {

    }
    //load reminders
    this.load = function (data) {
        try {
            if (data!=null) {
                var tbody = document.getElementById('tbodyReminder');
                $(tbody.rows[0]).remove();
                var row = tbody.insertRow(0);
                row.insertCell(0); row.insertCell(1); row.insertCell(2); row.insertCell(3)
                row.cells[0].innerHTML = data.Message;
                row.cells[1].innerHTML = data.ActivityDate;
                row.cells[2].innerHTML = data.MemberID;
            }
        } catch (e) {

        }
    }
    this.getreminders = function (e) {
        try {
            var inv = new $rab.Server.Dispatcher();
            inv.obj = {
                // load reminders from branch
                branchId: JSON.parse(localStorage.getItem('user')).BranchID
            };
            inv.url = 'ManagementList.aspx/GetReminder';
            inv.handler = function (data) {
                try {
                    //alert(data);
                    if (data != null) {
                        var tbody = document.getElementById('tbodyReminder');
                        $(tbody ).empty();
                        for (var i = 0; i < data.length; i++) {
                           
                            var row = tbody.insertRow(i);
                            row.insertCell(0); row.insertCell(1); row.insertCell(2);
                            row.insertCell(3); row.insertCell(4);
                            row.cells[0].innerHTML = data[i].Message;
                            row.cells[1].innerHTML = data[i].ActivityDate;
                            row.cells[2].innerHTML = data[i].MemberID;
                            row.cells[3].appendChild(document.createElement('span'));
                            row.cells[3].firstChild.className = 'badge badge-danger';
                            row.cells[3].firstChild.innerHTML = 'remove note'
                            row.cells[3].firstChild.note = data[i];
                            row.cells[3].firstChild.row = row;
                            row.cells[3].firstChild.onclick = function () {
                                var note = new $rab.Server.Dispatcher();
                                note.obj = { id: this.note.Id };
                                var row = this.row;
                                note.url = "ManagementList.aspx/RemoveNote";
                                note.handler = function (d) {
                                    try {
                                        if (d!=null&&d=="success") {
                                            $(row).remove();
                                        }
                                    } catch (e) {

                                    }
                                }
                                note.invoke();
                            }
                        }
                    }
                } catch (e) {

                }
            }
            inv.invoke();
        } catch (e) {

        }
    }
}
$rab.theme = function () {
    this.cancel_theme_update = function () {
        try {
            //get current theme from configuration table
            var client = new $rab.Server.Dispatcher();
            client.url = 'ManagementList.aspx/GetChurchTheme'
            client.obj = {};
            client.handler = new $rab.theme().update_theme
            client.invoke();
        } catch (e) {

        }
    }
    this.update_theme = function (e) {
        if (e!=null) {
            //clear theme container and write text into it
            var apply_logo = document.getElementById('panel-edit-logo');
            var theme_placeholder = document.getElementById('panel-theme');
            $(theme_placeholder).empty();
            $(apply_logo).empty();
            $(theme_placeholder).html(e);
        }
    }
    this.prep_theme_edit = function () {
        var apply_logo = document.getElementById('panel-edit-logo');
        apply_logo.appendChild(document.createElement('span'));
        apply_logo.appendChild(document.createElement('span'));
        var spanedit = apply_logo.firstChild;
        var span_cancel = apply_logo.lastChild;

        spanedit.innerHTML = 'update';
        spanedit.className = 'badge badge-primary';
        spanedit.style.cursor = 'pointer';

        span_cancel.innerHTML = 'cancel';
        span_cancel.className = 'badge badge-warning';
        span_cancel.style.cursor = 'pointer';
        span_cancel.onclick = this.cancel_theme_update;

        return new Array(spanedit, span_cancel);
    }
    this.edit = function () {
        //get content of theme and place it in a text area for editing
        var themetext = $('#panel-theme').text();//theme text
        var theme_placeholder = document.getElementById('panel-theme');
        $(theme_placeholder).empty();
        theme_placeholder.appendChild(document.createElement('textarea'));

        var span = this.prep_theme_edit()[0];

        var text_area = theme_placeholder.firstChild;
        text_area.innerHTML = themetext;
        text_area.cols = 6;
        text_area.rows = 6;
        text_area.className = 'form-control';
        span.themeText = text_area
        span.onclick = this.add;
    }
    this.add = function () {
        // update theme table with new data
        var client = new $rab.Server.Dispatcher();
        client.url = 'ManagementList.aspx/UpdateChurchTheme'
        client.obj = { theme: this.themeText.textContent  }
        client.handler = new $rab.theme().update_theme;
        client.invoke();
    }
}
$(function () {
    try {
         
       
        //new
        new $rab.AuditTrail().PageVisited("Management Panel");
        new $rab.Reminder().getreminders();
        $('.list-group-item').on('mouseover', function () {
            try {
                $('.list-group-item').removeClass('active')
                $(this).addClass('active');
            } catch (e) {

            }
        });
        new $rab.theme().cancel_theme_update();//loads theme
        
    } catch (e) {

    }
  

});
function birthdayAlert() {
    //check if user has been asked to display birthday alert
    var isAnswered = sessionStorage.getItem("ShowBirthdays");
    var modal = function () {
        //set next visit flag
        sessionStorage.setItem("ShowBirthdays", "showNextVisit")
        //display birthday alert
        $('#alertTitle').html('Happy birthday wishes window');
        var container = document.getElementById('alertBody');
        $(container).empty();

        //set reminder if subsequent visit to page displays modal form
        document.getElementById("buttonDismissAlert").onclick = function () {

            sessionStorage.setItem("ShowBirthdays", "dontshowNextVisit");
            $('button[data-dismiss="modal"]').click();
        };
        $rab.Login.User = JSON.parse(localStorage.getItem("user"));
        var func = new $rab.View(container);

        func.birthday($rab.Login.User.BranchID);
        $('button[data-target="#myModal"]').click();


    }
    if (isAnswered == null) { modal(); }
    else if (isAnswered != null) {
        //birthday alert was displayed in previous visit.
        //display message if user wants to still see birthday presents
        if (isAnswered == "showNextVisit") modal();
        else if (isAnswered == "dontshowNextVisit") {

        }
    }
}