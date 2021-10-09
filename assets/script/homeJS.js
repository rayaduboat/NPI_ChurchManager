$(function () {
    try {
        var user = JSON.parse(localStorage.getItem("user"));
        if (user == null) location.assign("Default.aspx");
        //welcome the user for logging in
        $("#h2loggeduser").html("Welcome <br/>" + user.FirstName + " " + user.LastName);

    } catch (e) {
        //alert(e.message);
    }
})