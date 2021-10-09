$rab.CustomReport = $rab.CustomReport || {};
$rab.CustomReport.Permissionset = ["All", "SuperUser", "Standard Reports"]
$rab.CustomReport.Data = new Array();
$rab.CustomReport.Initialise = function () {
    try {

        // Close the dropdown if the user clicks outside of it
        new $rab.Security.LockDown().PagePermission($rab.CustomReport.Permissionset);
        setTimeout(new $rab.AuditTrail().PageVisited("Custom Reports"), 1000);
        $rab.Utilities.FillOptions(["All"], "selectBranchNames");
        $rab.Security.Church.LoadBranches("selectBranchNames");


        $("#selectBranchNames").on("change", function (event) {
            //assign selected branchname to server branchname
            try {
                $("#serverBranchName").val(this.options[this.selectedIndex].BranchID);
                event.preventDefault();
            } catch (e) {

            }

        });

    } catch (e) {

    }
}