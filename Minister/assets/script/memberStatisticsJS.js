$rab.Membership.Statistics = function () {

    try {
        //build gender statistics
        var url, obj, handler;
        url = 'Statistics.aspx/Statistics';
        obj = {
            branchName: $("#selectBranchNames").val()
        };
        handler = function (jsonmessage) {
            try {
                if (jsonmessage == "Adding member failed miserably") throw new $rab.Exception(jsonmessage);
                var parse = JSON.parse(jsonmessage)
                //if value is null then return 0

                //
                document.getElementById("modal-stats-title").innerHTML = "<kbd>" + obj.branchName + "</kbd>" + ": Membership statistics"

                //Build three tables and populate with data statistics
                //member statistics
                $("#tbodygender").empty(); $("#tbodymembershiptype").empty(); $("#tbodyAgeAbove35").empty();
                $("#tbodyChildren_0_to_12").empty(); $("#tbodyTeenage_13_to_19").empty();
                $("#tbodyYoungAdult_20_to_35").empty();
                // overall statistics
                var tr = document.createElement("tr");
                //tr.style.backgroundColor = "#293955 !important";
                //tr.style.color = "white !important";
                var tdgender = document.createElement("td"); tdgender.innerHTML =    "<span >" + "Gender"                                                + "</span>";
                var tdmale   = document.createElement("td"); tdmale.innerHTML =      "<span >" + parse.GenderStats[0].Male                               + "</span>";
                var tdfemale = document.createElement("td"); tdfemale.innerHTML =    "<span >" + parse.GenderStats[0].Female                             + "</span>";
                var tdtotal  = document.createElement("td"); tdtotal.innerHTML =     "<span >" + parse.GenderStats[0].Total + "</span>";
                tr.appendChild(tdgender);//tdgender.style.color = "white !important";
                tr.appendChild(tdmale);  //tdmale  .style.color = "white !important";
                tr.appendChild(tdfemale);//tdfemale.style.color = "white !important";
                tr.appendChild(tdtotal) ;//tdtotal .style.color = "white !important";
                document.getElementById("tbodygender").appendChild(tr);

                (function () {
                    var tr = document.createElement("tr");
                    //tr.style.backgroundColor = "#293955 !important";
                    //tr.style.color = "white !important";
                    //    if (parse.AgeCategoryByGenderStats[i].AgeCategory =="Above 35"){
                    var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = "<span >" + "Above 35" + "</span>";
                    var tdAgeAbove35_Male = document.createElement("td"); tdAgeAbove35_Male.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].AgeAbove35_Male + "</span>";
                    var tdAgeAbove35_FeMale = document.createElement("td"); tdAgeAbove35_FeMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].AgeAbove35_FeMale + "</span>";
                    var tdAgeAbove35_Total = document.createElement("td"); tdAgeAbove35_Total.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].AgeAbove35_Total + "</span>";
                    tr.appendChild(tdAgeCategory);        //tdAgeCategory.style.color = "white !important";
                    tr.appendChild(tdAgeAbove35_Male);    //tdAgeAbove35_Male.style.color = "white !important";
                    tr.appendChild(tdAgeAbove35_FeMale);  //tdAgeAbove35_FeMale.style.color = "white !important";
                    tr.appendChild(tdAgeAbove35_Total);   //tdAgeAbove35_Total.style.color = "white !important";
                    document.getElementById("tbodyAgeAbove35").appendChild(tr);
                    //    }
                })();
                (function () {
                    var tr = document.createElement("tr");
                    //tr.style.backgroundColor = "#293955 !important";
                    //tr.style.color = "white !important";
                    //// if (parse.AgeCategoryByGenderStats[i].AgeCategory == "Children (0-12)") {
                    var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = "<span >" + "Children (0-12)" + "</span>";
                    var tdMale = document.createElement("td"); tdMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Children_0_to_12_Male + "</span>";
                    var tdFeMale = document.createElement("td"); tdFeMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Children_0_to_12_Female + "</span>";
                    var tdTotal = document.createElement("td"); tdTotal.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Children_0_to_12_Total + "</span>";

                    tr.appendChild(tdAgeCategory); tr.appendChild(tdMale); tr.appendChild(tdFeMale);
                    tr.appendChild(tdTotal);
                    document.getElementById("tbodyChildren_0_to_12").appendChild(tr);
                })();
                (function () {
                    var tr = document.createElement("tr");
                    //tr.style.backgroundColor = "#293955 !important";
                    //tr.style.color = "white !important";
                    //// if (parse.AgeCategoryByGenderStats[i].AgeCategory == "Teenage(13-19)") {
                    var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = "<span >" + "Teenage(13-19)" + "</span>";
                    var tdMale = document.createElement("td"); tdMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Teenage_13_to_19_Male + "</span>";
                    var tdFeMale = document.createElement("td"); tdFeMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Teenage_13_to_19_Female + "</span>";
                    var tdTotal = document.createElement("td"); tdTotal.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].Teenage_13_to_19_Total + "</span>";

                    tr.appendChild(tdAgeCategory); tr.appendChild(tdMale); tr.appendChild(tdFeMale);
                    tr.appendChild(tdTotal);
                    document.getElementById("tbodyTeenage_13_to_19").appendChild(tr);
                })();
                (function () {
                    var tr = document.createElement("tr");
                    //tr.style.backgroundColor = "#293955 !important";
                    //tr.style.color = "#fcfcfc !important";

                    //  if (parse.AgeCategoryByGenderStats[i].AgeCategory == "Young Adults(20-35)") {
                    var tdAgeCategory = document.createElement("td"); tdAgeCategory.innerHTML = "<span >" + "Young Adults(20-35)" + "</span>";
                    var tdMale = document.createElement("td"); tdMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].YoungAdult_20_to_35_Male + "</span>";
                    var tdFeMale = document.createElement("td"); tdFeMale.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].YoungAdult_20_to_35_Female + "</span>";
                    var tdTotal = document.createElement("td"); tdTotal.innerHTML = "<span >" + parse.AgeCategoryByGenderStats[0].YoungAdult_20_to_35_Total + "</span>";

                    tr.appendChild(tdAgeCategory); tr.appendChild(tdMale); tr.appendChild(tdFeMale);
                    tr.appendChild(tdTotal);
                    document.getElementById("tbodyYoungAdult_20_to_35").appendChild(tr);

                })();


                document.getElementById("buttonStatistics").click();
            } catch (e) {
                alert(e.message);
            }
        }
        if (obj.branchName == "Please select branch" || obj.branchName.trim().length == 0) throw new $rab.Exception("Please select branch");
        new $rab.Server.Method().BeginInvoke(url, obj, handler);
        //build membership statistics
        //build agecategory by gender category


    } catch (e) {
        alert(e.message);
    }

    function nulltozero(val) {

        return val == null || val == 'undefined' ? 0 : val;
    }
}
$(function () {

})