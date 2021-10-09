<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberUpdate.aspx.cs" Inherits="Minister_MembershipList" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Rabant.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="assets/images/pentecost-hospital-jobs-in-ghana-128x128.jpg" type="image/x-icon">
    <meta name="description" content="MembershipList">
    <title>MembershipUpdate</title>
    <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="assets/tether/tether.min.css">
    <link rel="stylesheet" href="assets/soundcloud-plugin/style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="assets/dropdown/css/style.css">
    <link rel="stylesheet" href="assets/data-tables/data-tables.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/socicon/css/styles.css">
    <link rel="stylesheet" href="assets/theme/css/style.css">
    <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
    <link href="assets/theme/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />


</head>
<body>


    <section class="section-table cid-qBsl1UHSIu" id="table1-0" data-rv-view="143">


        <div class="container container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Personel details update</h2>
            <h3 class="mbr-section-subtitle mbr-fonts-style align-center pb-5 mbr-light display-5"></h3>
            <input type="hidden" id="buttonmodalpopup" data-toggle="modal" data-target="#myNewMemberModal" />
            <div class="">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 text-left pt-3"><b>Enter Member ID</b></div>
                        <div class="col-sm-4">
                            <input type="text" id="textboxPersonalID" class="form-control" style="background-color: white!important" />
                        </div>

                    </div>
                    <div class="row mt-2 mb-2">
                        <div class="col-sm-4 text-left pt-3"><b>Telephone number</b></div>
                        <div class="col-sm-4">
                            <input  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  type="text" id="textboxTelephoneNumber" class="form-control" style="background-color: white!important" />
                        </div>

                    </div>
                    <div class="row mt-2 mb-2">
                        <div class="col-sm-4 text-left pt-3"><b>Branch name</b></div>
                        <div class="col-sm-4">
                            <form runat="server">
                                <asp:TextBox Enabled="false" CssClass="form-control" ID="TextBoxBranchNames" runat="server"></asp:TextBox>
                            </form>
                            <%--<select id="selectBranchNames" class="form-control" style="background-color: white!important" onchange="{$rab.Membership.GetMembers($('#selectBranchNames').val());}">
                                <option selected value="Please select branch">Please select branch</option>

                            </select>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 mb-3"></div>
                        <div class="col-sm-4 mt-3">
                            <span id="submitID" style="display: none;" data-toggle="modal" data-target="#myNewMemberModal"></span>
                            <button style="background-color: #293955; color: white" class="form-control" id="buttonLoadDetails">Load my details</button>
                            <script>
                                buttonLoadDetails.onclick = function () {
                                    try {
                                        var id = textboxPersonalID.value;
                                        if (id == "" || typeof id == 'undefined') throw new Error('Invalid member id');
                                        //textboxPersonalID.value = "";
                                        var branchIDServer = document.getElementById('TextBoxBranchNames').value;
                                        var branchid = $('#TextBoxBranchNames').attr('branchID');
                                        var telephone = $('#textboxTelephoneNumber').val();
                                        if (telephone == "" ||
                                            typeof telephone == 'undefined')
                                            throw new Error('Invalid telephone number');

                                        // var branchid = document.getElementById("selectBranchNames").options[document.getElementById("selectBranchNames").selectedIndex].BranchID;
                                        if (branchid == "" || typeof branchid == 'undefined') throw new Error('Invalid Branch selected');
                                        new $rab.Server.Method().BeginInvoke("MembershipList.aspx/GetMemberInfo",
                                            { ID: id, branch: branchid, tel: telephone },
                                            function (jsondata) {
                                                try {
                                                    //CHECK IF MEMBER DETAILS IS CORRECT
                                                    var parsed = JSON.parse(jsondata);
                                                    if (parsed.message == "success" && parsed.result != null) {
                                                        //GET INFO FROM SERVER AND POPULATE GUI
                                                        $rab.Membership.FillModalWithPersonalDetails(parsed.result)
                                                        //UPDATE GUI DATA
                                                        //DISPLAY GUI
                                                        submitID.click();
                                                    }
                                                    else {
                                                        alert("Unknown member ID or Branch");
                                                    }

                                                } catch (e) {

                                                }

                                            }

                                        );
                                    } catch (e) {
                                        alert(e.message);
                                    }
                                }
                            </script>
                        </div>

                    </div>
                </div>

                <div class="container scroll" style="display: none;">
                    <div class="container">
                        <div class="row">

                            <div class="col-sm-2">
                                <div class="dropdown">
                                    <button type="button" class="form-control dropdown-toggle" data-toggle="dropdown">
                                        View
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" onclick="{ $rab.Membership.GetMembers($('#selectBranchNames').val()); }">Members</a>
                                        <a class="dropdown-item" href="#" onclick="{ $rab.Membership.GetNonMembers($('#selectBranchNames').val()); }">Non-members</a>
                                        <a class="dropdown-item" href="#" onclick="{$rab.Membership.Statistics();}">Statistics</a>
                                    </div>
                                </div>


                            </div>
                            <div class="col-sm-2">
                                <div class="dropdown">
                                    <button type="button" class="form-control dropdown-toggle" data-toggle="dropdown">
                                        Member
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" onclick="{ $rab.Membership.Modal(false) }">Add new</a>
                                        <%--<a class="dropdown-item" href="#" >Non-members</a>
                                        <a class="dropdown-item" href="#" >Statistics</a>--%>
                                    </div>
                                </div>


                            </div>
                            <div class="col-sm-4">

                                <input type="text" class="form-control" style="background-color: white!important;" id="textboxsearchstring" name="findText" value="" placeholder="enter search string" />


                            </div>
                            <div class="col-sm-1 pt-3">
                                <i class="fa fa-search fa-lg"></i>

                            </div>

                        </div>
                    </div>
                    <table class="table table-hover" cellspacing="0" id="tableMemberListing">

                        <thead>
                            <tr class="">

                                <th class="head-item mbr-fonts-style display-7">First Name
                                </th>
                                <th class="head-item mbr-fonts-style display-7">Last Name
                                </th>
                                <th class="head-item mbr-fonts-style display-7">Telephone Number
                                </th>
                                <th class="head-item mbr-fonts-style display-7">Email Address 
                                </th>
                                <th class="head-item mbr-fonts-style display-7">Membership Type
                                </th>
                                <th class="head-item mbr-fonts-style display-7">Edit Info
                                </th>
                            </tr>
                        </thead>
                        <tbody id="tbodyMembers">
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </section>



    <section class="modal-dialog-1">
        <div class="container-fluid">

            <!-- Button to Open the Modal -->


            <!-- The Modal -->
            <div class="modal fade" id="myNewMemberModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title"><kbd>Fill in member details</kbd></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            GDPR consent form, please read and check to consent to terms<hr />
                            <div style="color: red">
                                By providing your contact information, you are confirming 
                                you are an adult 18 years or older and you authorize us 
                                to contact you by email or telephone with information about
                                 Follow-up, events, and updates. You may unsubscribe 
                                at any time by clicking the link provided in our communications. 
                                Please review our Privacy Notice for more information.
                                <a href="#" data-toggle="collapse" data-target="#demo">Click here </a>
                            </div>
                            <div id="demo" class="collapse">
                                <div class="row mb-2">

                                    <div class="col-sm-3">Title</div>
                                    <div class="col-sm-4">
                                        <select id="selectNewMemberTitle" class="form-control">
                                            <option value="Select title">Select title</option>
                                            <option value="Mr">Mr</option>
                                            <option value="Mrs">Mrs</option>
                                            <option value="Master">Master</option>
                                            <option value="Miss">Miss</option>
                                            <option value="Elder">Elder</option>
                                            <option value="Deacon">Deacon</option>
                                            <option value="Deaconess">Deaconess</option>
                                            <option value="Pastor">Pastor</option>
                                            <option value="Brother">Brother</option>
                                            <option value="Sister">Sister</option>
                                            <option value="Reverend">Reverend</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-2">

                                    <div class="col-sm-3">Gender</div>
                                    <div class="col-sm-4">

                                        <select id="selectNewMemberGender" class="form-control">
                                            <option value="Select gender">Select gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>

                                        </select>

                                    </div>
                                </div>


                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">FirstName</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberFirstName" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">LastName</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberLastName" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-sm-3">Marital status</div>
                                    <div class="col-sm-8">

                                        <select id="textboxMaritalStatus" class="form-control">
                                            <option value="Select marital status">Select marital status</option>
                                            <option value="Single">Single</option>
                                            <option value="Married">Married</option>
                                            <option value="Widow">Widow</option>
                                            <option value="Widower">Widower</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">DOB</div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberDOB" class="form-control" maxlength="10" type="text" name="textbox" value="" placeholder="dd/mm/yyyy .." />
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">Country of Nationality</div>
                                    <div class="col-sm-8">
                                        <select id="textboxNationality" class="form-control">
                                            <option value="Select country">Select country</option>
                                            <option value="Afghanistan">Afghanistan</option>
                                            <option value="Albania">Albania</option>
                                            <option value="Algeria">Algeria</option>
                                            <option value="American Samoa">American Samoa</option>
                                            <option value="Andorra">Andorra</option>
                                            <option value="Angola">Angola</option>
                                            <option value="Anguilla">Anguilla</option>
                                            <option value="Antigua and Barbuda ">Antigua and Barbuda</option>
                                            <option value="Argentina ">Argentina </option>
                                            <option value="Armenia ">Armenia</option>
                                            <option value="Aruba ">Aruba </option>
                                            <option value="Australia ">Australia </option>
                                            <option value="Austria ">Austria</option>
                                            <option value="Azerbaijan">Azerbaijan</option>
                                            <option value="Bahamas ">Bahamas</option>
                                            <option value="Bahrain ">Bahrain</option>
                                            <option value="Bangladesh">Bangladesh</option>
                                            <option value="Barbados">Barbados</option>
                                            <option value="Belarus">Belarus</option>
                                            <option value="Belgium">Belgium</option>
                                            <option value="Belize">Belize</option>
                                            <option value="Benin">Benin </option>
                                            <option value="Bermuda">Bermuda</option>
                                            <option value="Bhutan">Bhutan</option>
                                            <option value="Bolivia">Bolivia</option>
                                            <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                            <option value="Botswana">Botswana</option>
                                            <option value="Brazil">Brazil</option>
                                            <option value="British Virgin Islands">British Virgin Islands</option>
                                            <option value="Brunei">Brunei</option>
                                            <option value="Bulgaria">Bulgaria</option>
                                            <option value="Burkina Faso">Burkina Faso</option>
                                            <option value="Burundi ">Burundi</option>
                                            <option value="Côte d'Ivoire ">Côte d'Ivoire</option>
                                            <option value="Cabo Verde">Cabo Verde</option>
                                            <option value="Cambodia">Cambodia</option>
                                            <option value="Cameroon">Cameroon</option>
                                            <option value="Canada">Canada</option>
                                            <option value="Caribbean Netherlands">Caribbean Netherlands </option>
                                            <option value="Cayman Islands">Cayman Islands </option>
                                            <option value="Central African Republic">Central African Republic</option>
                                            <option value="Chad">Chad</option>
                                            <option value="Channel Islands ">Channel Islands</option>
                                            <option value="Chile">Chile</option>
                                            <option value="China">China</option>
                                            <option value="Colombia">Colombia</option>
                                            <option value="Comoros">Comoros</option>
                                            <option value="Congo (Congo-Brazzaville)">Congo (Congo-Brazzaville)</option>
                                            <option value="Cook Islands">Cook Islands</option>
                                            <option value="Costa Rica">Costa Rica</option>
                                            <option value="Croatia">Croatia</option>
                                            <option value="Cuba">Cuba</option>
                                            <option value="Curaçao ">Curaçao</option>
                                            <option value="Cyprus">Cyprus</option>
                                            <option value="Czech Republic">Czech Republic </option>
                                            <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
                                            <option value="Denmark">Denmark</option>
                                            <option value="Djibouti">Djibouti</option>
                                            <option value="Dominica">Dominica</option>
                                            <option value="Dominican Republic">Dominican Republic </option>
                                            <option value="Ecuador">Ecuador</option>
                                            <option value="Egypt">Egypt </option>
                                            <option value="El Salvador">El Salvador </option>
                                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                                            <option value="Eritrea">Eritrea</option>
                                            <option value="Estonia">Estonia</option>
                                            <option value="Ethiopia">Ethiopia</option>
                                            <option value="Faeroe Islands">Faeroe Islands </option>
                                            <option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas) </option>
                                            <option value="Fiji">Fiji</option>
                                            <option value="Finland">Finland</option>
                                            <option value="France">France</option>
                                            <option value="French Guiana">French Guiana</option>
                                            <option value="French Polynesia">French Polynesia </option>
                                            <option value="Gabon">Gabon </option>
                                            <option value="Gambia">Gambia</option>
                                            <option value="Georgia">Georgia</option>
                                            <option value="Germany">Germany</option>
                                            <option value="Ghana">Ghana </option>
                                            <option value="Gibraltar">Gibraltar </option>
                                            <option value="Greece">Greece</option>
                                            <option value="Greenland ">Greenland </option>
                                            <option value="Grenada ">Grenada</option>
                                            <option value="Guadeloupe">Guadeloupe</option>
                                            <option value="Guam">Guam</option>
                                            <option value="Guatemala ">Guatemala </option>
                                            <option value="Guinea">Guinea</option>
                                            <option value="Guinea-Bissau">Guinea-Bissau</option>
                                            <option value="Guyana">Guyana</option>
                                            <option value="Haiti">Haiti </option>
                                            <option value="Holy See">Holy See</option>
                                            <option value="Honduras">Honduras</option>
                                            <option value="Hong Kong (S.A.R. of China)">Hong Kong (S.A.R. of China) </option>
                                            <option value="Hungary">Hungary</option>
                                            <option value="Iceland">Iceland</option>
                                            <option value="India">India </option>
                                            <option value="Indonesia">Indonesia </option>
                                            <option value="Iran">Iran </option>
                                            <option value="Iraq ">Iraq</option>
                                            <option value="Ireland">Ireland</option>
                                            <option value="Isle of Man">Isle of Man</option>
                                            <option value="Israel ">Israel</option>
                                            <option value="Italy">Italy </option>
                                            <option value="Jamaica">Jamaica</option>
                                            <option value="Japan">Japan </option>
                                            <option value="Jordan ">Jordan</option>
                                            <option value="Kazakhstan ">Kazakhstan </option>
                                            <option value="Kenya">Kenya </option>
                                            <option value="Kiribati ">Kiribati </option>
                                            <option value="Kuwait ">Kuwait</option>
                                            <option value="Kyrgyzstan ">Kyrgyzstan </option>
                                            <option value="Laos ">Laos</option>
                                            <option value="Latvia ">Latvia</option>
                                            <option value="Lebanon">Lebanon</option>
                                            <option value="Lesotho">Lesotho</option>
                                            <option value="Liberia">Liberia</option>
                                            <option value="Libya">Libya </option>
                                            <option value="Liechtenstein ">Liechtenstein</option>
                                            <option value="Lithuania">Lithuania </option>
                                            <option value="Luxembourg">Luxembourg</option>
                                            <option value="Macao (S.A.R. of China)">Macao (S.A.R. of China) </option>
                                            <option value="Macedonia (FYROM)">Macedonia (FYROM)</option>
                                            <option value="Madagascar ">Madagascar </option>
                                            <option value="Malawi ">Malawi</option>
                                            <option value="Malaysia ">Malaysia </option>
                                            <option value="Maldives ">Maldives </option>
                                            <option value="Mali ">Mali</option>
                                            <option value="Malta">Malta </option>
                                            <option value="Marshall Islands ">Marshall Islands </option>
                                            <option value="Martinique">Martinique </option>
                                            <option value="Mauritania">Mauritania </option>
                                            <option value="Mauritius ">Mauritius</option>
                                            <option value="Mayotte ">Mayotte</option>
                                            <option value="Mexico">Mexico</option>
                                            <option value="Micronesia">Micronesia </option>
                                            <option value="Moldova ">Moldova</option>
                                            <option value="Monaco">Monaco</option>
                                            <option value="Mongolia">Mongolia </option>
                                            <option value="Montenegro">Montenegro </option>
                                            <option value="Montserrat">Montserrat </option>
                                            <option value="Morocco ">Morocco</option>
                                            <option value="Mozambique">Mozambique </option>
                                            <option value="Myanmar (formerly Burma)">Myanmar (formerly Burma)</option>
                                            <option value="Namibia ">Namibia</option>
                                            <option value="Nauru">Nauru </option>
                                            <option value="Nepal">Nepal </option>
                                            <option value="Netherlands ">Netherlands </option>
                                            <option value="New Caledonia ">New Caledonia</option>
                                            <option value="New Zealand ">New Zealand </option>
                                            <option value="Nicaragua ">Nicaragua </option>
                                            <option value="Niger">Niger </option>
                                            <option value="Nigeria ">Nigeria</option>
                                            <option value="Niue ">Niue</option>
                                            <option value="North Korea ">North Korea </option>
                                            <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                            <option value="Norway">Norway</option>
                                            <option value="Oman ">Oman</option>
                                            <option value="Pakistan">Pakistan</option>
                                            <option value="Palau">Palau </option>
                                            <option value="Palestine State ">Palestine State</option>
                                            <option value="Panama">Panama</option>
                                            <option value="Papua New Guinea">Papua New Guinea </option>
                                            <option value="Paraguay">Paraguay</option>
                                            <option value="Peru ">Peru</option>
                                            <option value="Philippines ">Philippines </option>
                                            <option value="Poland">Poland</option>
                                            <option value="Portugal">Portugal</option>
                                            <option value="Puerto Rico ">Puerto Rico </option>
                                            <option value="Qatar">Qatar </option>
                                            <option value="Réunion ">Réunion</option>
                                            <option value="Romania">Romania</option>
                                            <option value="Russia">Russia</option>
                                            <option value="Rwanda">Rwanda</option>
                                            <option value="Saint Helena">Saint Helena</option>
                                            <option value="Saint Kitts and Nevis">Saint Kitts and Nevis </option>
                                            <option value="Saint Lucia">Saint Lucia </option>
                                            <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon </option>
                                            <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                            <option value="Samoa">Samoa </option>
                                            <option value="San Marino">San Marino</option>
                                            <option value="Sao Tome and Principe">Sao Tome and Principe </option>
                                            <option value="Saudi Arabia ">Saudi Arabia</option>
                                            <option value="Senegal">Senegal</option>
                                            <option value="Serbia ">Serbia</option>
                                            <option value="Seychelles ">Seychelles</option>
                                            <option value="Sierra Leone ">Sierra Leone</option>
                                            <option value="Singapore">Singapore </option>
                                            <option value="Sint Maarten ">Sint Maarten</option>
                                            <option value="Slovakia ">Slovakia</option>
                                            <option value="Slovenia ">Slovenia</option>
                                            <option value="Solomon Islands">Solomon Islands</option>
                                            <option value="Somalia">Somalia</option>
                                            <option value="South Africa ">South Africa</option>
                                            <option value="South Korea">South Korea </option>
                                            <option value="South Sudan">South Sudan </option>
                                            <option value="Spain">Spain </option>
                                            <option value="Sri Lanka">Sri Lanka </option>
                                            <option value="Sudan">Sudan </option>
                                            <option value="Suriname ">Suriname</option>
                                            <option value="Swaziland">Swaziland </option>
                                            <option value="Sweden ">Sweden</option>
                                            <option value="Switzerland">Switzerland </option>
                                            <option value="Syria">Syria </option>
                                            <option value="Taiwan ">Taiwan</option>
                                            <option value="Tajikistan ">Tajikistan</option>
                                            <option value="Tanzania ">Tanzania</option>
                                            <option value="Thailand ">Thailand</option>
                                            <option value="Timor-Leste">Timor-Leste </option>
                                            <option value="Togo">Togo</option>
                                            <option value="Tokelau">Tokelau</option>
                                            <option value="Tonga">Tonga </option>
                                            <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                            <option value="Tunisia">Tunisia</option>
                                            <option value="Turkey">Turkey</option>
                                            <option value="Turkmenistan">Turkmenistan</option>
                                            <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                            <option value="Tuvalu">Tuvalu</option>
                                            <option value="Uganda">Uganda</option>
                                            <option value="Ukraine">Ukraine</option>
                                            <option value="United Arab Emirates">United Arab Emirates</option>
                                            <option selected value="United Kingdom">United Kingdom </option>
                                            <option value="United States of America">United States of America</option>
                                            <option value="United States Virgin Islands">United States Virgin Islands</option>
                                            <option value="Uruguay">Uruguay</option>
                                            <option value="Uzbekistan">Uzbekistan</option>
                                            <option value="Vanuatu">Vanuatu</option>
                                            <option value="Venezuela">Venezuela </option>
                                            <option value="Viet Nam">Viet Nam</option>
                                            <option value="Wallis and Futuna Islands">Wallis and Futuna Islands </option>
                                            <option value="Western Sahara">Western Sahara </option>
                                            <option value="Yemen">Yemen </option>
                                            <option value="Zambia">Zambia</option>
                                            <option value="Zimbabwe">Zimbabwe</option>

                                        </select>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-8">
                                    </div>


                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Address line one</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberAddressLineone" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Address line two</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberAddressLinetwo" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Postcode</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberPostcode" maxlength="10" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Town/County</label>
                                    </div>
                                    <div class="col-sm-8">

                                        <div class="row mb-2">
                                            <div class="col-sm-6">
                                                <input id="textboxNewMemberTown" class="form-control" type="text" name="Town" value="" placeholder="town.." />
                                            </div>
                                            <div class="col-sm-6">
                                                <select id="selectNewMemberCountry" class="form-control">
                                                    <option value="Select country">Select country</option>
                                                    <option value="Afghanistan">Afghanistan</option>
                                                    <option value="Albania">Albania</option>
                                                    <option value="Algeria">Algeria</option>
                                                    <option value="American Samoa">American Samoa</option>
                                                    <option value="Andorra">Andorra</option>
                                                    <option value="Angola">Angola</option>
                                                    <option value="Anguilla">Anguilla</option>
                                                    <option value="Antigua and Barbuda ">Antigua and Barbuda</option>
                                                    <option value="Argentina ">Argentina </option>
                                                    <option value="Armenia ">Armenia</option>
                                                    <option value="Aruba ">Aruba </option>
                                                    <option value="Australia ">Australia </option>
                                                    <option value="Austria ">Austria</option>
                                                    <option value="Azerbaijan">Azerbaijan</option>
                                                    <option value="Bahamas ">Bahamas</option>
                                                    <option value="Bahrain ">Bahrain</option>
                                                    <option value="Bangladesh">Bangladesh</option>
                                                    <option value="Barbados">Barbados</option>
                                                    <option value="Belarus">Belarus</option>
                                                    <option value="Belgium">Belgium</option>
                                                    <option value="Belize">Belize</option>
                                                    <option value="Benin">Benin </option>
                                                    <option value="Bermuda">Bermuda</option>
                                                    <option value="Bhutan">Bhutan</option>
                                                    <option value="Bolivia">Bolivia</option>
                                                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                    <option value="Botswana">Botswana</option>
                                                    <option value="Brazil">Brazil</option>
                                                    <option value="British Virgin Islands">British Virgin Islands</option>
                                                    <option value="Brunei">Brunei</option>
                                                    <option value="Bulgaria">Bulgaria</option>
                                                    <option value="Burkina Faso">Burkina Faso</option>
                                                    <option value="Burundi ">Burundi</option>
                                                    <option value="Côte d'Ivoire ">Côte d'Ivoire</option>
                                                    <option value="Cabo Verde">Cabo Verde</option>
                                                    <option value="Cambodia">Cambodia</option>
                                                    <option value="Cameroon">Cameroon</option>
                                                    <option value="Canada">Canada</option>
                                                    <option value="Caribbean Netherlands">Caribbean Netherlands </option>
                                                    <option value="Cayman Islands">Cayman Islands </option>
                                                    <option value="Central African Republic">Central African Republic</option>
                                                    <option value="Chad">Chad</option>
                                                    <option value="Channel Islands ">Channel Islands</option>
                                                    <option value="Chile">Chile</option>
                                                    <option value="China">China</option>
                                                    <option value="Colombia">Colombia</option>
                                                    <option value="Comoros">Comoros</option>
                                                    <option value="Congo (Congo-Brazzaville)">Congo (Congo-Brazzaville)</option>
                                                    <option value="Cook Islands">Cook Islands</option>
                                                    <option value="Costa Rica">Costa Rica</option>
                                                    <option value="Croatia">Croatia</option>
                                                    <option value="Cuba">Cuba</option>
                                                    <option value="Curaçao ">Curaçao</option>
                                                    <option value="Cyprus">Cyprus</option>
                                                    <option value="Czech Republic">Czech Republic </option>
                                                    <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
                                                    <option value="Denmark">Denmark</option>
                                                    <option value="Djibouti">Djibouti</option>
                                                    <option value="Dominica">Dominica</option>
                                                    <option value="Dominican Republic">Dominican Republic </option>
                                                    <option value="Ecuador">Ecuador</option>
                                                    <option value="Egypt">Egypt </option>
                                                    <option value="El Salvador">El Salvador </option>
                                                    <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                    <option value="Eritrea">Eritrea</option>
                                                    <option value="Estonia">Estonia</option>
                                                    <option value="Ethiopia">Ethiopia</option>
                                                    <option value="Faeroe Islands">Faeroe Islands </option>
                                                    <option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas) </option>
                                                    <option value="Fiji">Fiji</option>
                                                    <option value="Finland">Finland</option>
                                                    <option value="France">France</option>
                                                    <option value="French Guiana">French Guiana</option>
                                                    <option value="French Polynesia">French Polynesia </option>
                                                    <option value="Gabon">Gabon </option>
                                                    <option value="Gambia">Gambia</option>
                                                    <option value="Georgia">Georgia</option>
                                                    <option value="Germany">Germany</option>
                                                    <option value="Ghana">Ghana </option>
                                                    <option value="Gibraltar">Gibraltar </option>
                                                    <option value="Greece">Greece</option>
                                                    <option value="Greenland ">Greenland </option>
                                                    <option value="Grenada ">Grenada</option>
                                                    <option value="Guadeloupe">Guadeloupe</option>
                                                    <option value="Guam">Guam</option>
                                                    <option value="Guatemala ">Guatemala </option>
                                                    <option value="Guinea">Guinea</option>
                                                    <option value="Guinea-Bissau">Guinea-Bissau</option>
                                                    <option value="Guyana">Guyana</option>
                                                    <option value="Haiti">Haiti </option>
                                                    <option value="Holy See">Holy See</option>
                                                    <option value="Honduras">Honduras</option>
                                                    <option value="Hong Kong (S.A.R. of China)">Hong Kong (S.A.R. of China) </option>
                                                    <option value="Hungary">Hungary</option>
                                                    <option value="Iceland">Iceland</option>
                                                    <option value="India">India </option>
                                                    <option value="Indonesia">Indonesia </option>
                                                    <option value="Iran">Iran </option>
                                                    <option value="Iraq ">Iraq</option>
                                                    <option value="Ireland">Ireland</option>
                                                    <option value="Isle of Man">Isle of Man</option>
                                                    <option value="Israel ">Israel</option>
                                                    <option value="Italy">Italy </option>
                                                    <option value="Jamaica">Jamaica</option>
                                                    <option value="Japan">Japan </option>
                                                    <option value="Jordan ">Jordan</option>
                                                    <option value="Kazakhstan ">Kazakhstan </option>
                                                    <option value="Kenya">Kenya </option>
                                                    <option value="Kiribati ">Kiribati </option>
                                                    <option value="Kuwait ">Kuwait</option>
                                                    <option value="Kyrgyzstan ">Kyrgyzstan </option>
                                                    <option value="Laos ">Laos</option>
                                                    <option value="Latvia ">Latvia</option>
                                                    <option value="Lebanon">Lebanon</option>
                                                    <option value="Lesotho">Lesotho</option>
                                                    <option value="Liberia">Liberia</option>
                                                    <option value="Libya">Libya </option>
                                                    <option value="Liechtenstein ">Liechtenstein</option>
                                                    <option value="Lithuania">Lithuania </option>
                                                    <option value="Luxembourg">Luxembourg</option>
                                                    <option value="Macao (S.A.R. of China)">Macao (S.A.R. of China) </option>
                                                    <option value="Macedonia (FYROM)">Macedonia (FYROM)</option>
                                                    <option value="Madagascar ">Madagascar </option>
                                                    <option value="Malawi ">Malawi</option>
                                                    <option value="Malaysia ">Malaysia </option>
                                                    <option value="Maldives ">Maldives </option>
                                                    <option value="Mali ">Mali</option>
                                                    <option value="Malta">Malta </option>
                                                    <option value="Marshall Islands ">Marshall Islands </option>
                                                    <option value="Martinique">Martinique </option>
                                                    <option value="Mauritania">Mauritania </option>
                                                    <option value="Mauritius ">Mauritius</option>
                                                    <option value="Mayotte ">Mayotte</option>
                                                    <option value="Mexico">Mexico</option>
                                                    <option value="Micronesia">Micronesia </option>
                                                    <option value="Moldova ">Moldova</option>
                                                    <option value="Monaco">Monaco</option>
                                                    <option value="Mongolia">Mongolia </option>
                                                    <option value="Montenegro">Montenegro </option>
                                                    <option value="Montserrat">Montserrat </option>
                                                    <option value="Morocco ">Morocco</option>
                                                    <option value="Mozambique">Mozambique </option>
                                                    <option value="Myanmar (formerly Burma)">Myanmar (formerly Burma)</option>
                                                    <option value="Namibia ">Namibia</option>
                                                    <option value="Nauru">Nauru </option>
                                                    <option value="Nepal">Nepal </option>
                                                    <option value="Netherlands ">Netherlands </option>
                                                    <option value="New Caledonia ">New Caledonia</option>
                                                    <option value="New Zealand ">New Zealand </option>
                                                    <option value="Nicaragua ">Nicaragua </option>
                                                    <option value="Niger">Niger </option>
                                                    <option value="Nigeria ">Nigeria</option>
                                                    <option value="Niue ">Niue</option>
                                                    <option value="North Korea ">North Korea </option>
                                                    <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                    <option value="Norway">Norway</option>
                                                    <option value="Oman ">Oman</option>
                                                    <option value="Pakistan">Pakistan</option>
                                                    <option value="Palau">Palau </option>
                                                    <option value="Palestine State ">Palestine State</option>
                                                    <option value="Panama">Panama</option>
                                                    <option value="Papua New Guinea">Papua New Guinea </option>
                                                    <option value="Paraguay">Paraguay</option>
                                                    <option value="Peru ">Peru</option>
                                                    <option value="Philippines ">Philippines </option>
                                                    <option value="Poland">Poland</option>
                                                    <option value="Portugal">Portugal</option>
                                                    <option value="Puerto Rico ">Puerto Rico </option>
                                                    <option value="Qatar">Qatar </option>
                                                    <option value="Réunion ">Réunion</option>
                                                    <option value="Romania">Romania</option>
                                                    <option value="Russia">Russia</option>
                                                    <option value="Rwanda">Rwanda</option>
                                                    <option value="Saint Helena">Saint Helena</option>
                                                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis </option>
                                                    <option value="Saint Lucia">Saint Lucia </option>
                                                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon </option>
                                                    <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                                                    <option value="Samoa">Samoa </option>
                                                    <option value="San Marino">San Marino</option>
                                                    <option value="Sao Tome and Principe">Sao Tome and Principe </option>
                                                    <option value="Saudi Arabia ">Saudi Arabia</option>
                                                    <option value="Senegal">Senegal</option>
                                                    <option value="Serbia ">Serbia</option>
                                                    <option value="Seychelles ">Seychelles</option>
                                                    <option value="Sierra Leone ">Sierra Leone</option>
                                                    <option value="Singapore">Singapore </option>
                                                    <option value="Sint Maarten ">Sint Maarten</option>
                                                    <option value="Slovakia ">Slovakia</option>
                                                    <option value="Slovenia ">Slovenia</option>
                                                    <option value="Solomon Islands">Solomon Islands</option>
                                                    <option value="Somalia">Somalia</option>
                                                    <option value="South Africa ">South Africa</option>
                                                    <option value="South Korea">South Korea </option>
                                                    <option value="South Sudan">South Sudan </option>
                                                    <option value="Spain">Spain </option>
                                                    <option value="Sri Lanka">Sri Lanka </option>
                                                    <option value="Sudan">Sudan </option>
                                                    <option value="Suriname ">Suriname</option>
                                                    <option value="Swaziland">Swaziland </option>
                                                    <option value="Sweden ">Sweden</option>
                                                    <option value="Switzerland">Switzerland </option>
                                                    <option value="Syria">Syria </option>
                                                    <option value="Taiwan ">Taiwan</option>
                                                    <option value="Tajikistan ">Tajikistan</option>
                                                    <option value="Tanzania ">Tanzania</option>
                                                    <option value="Thailand ">Thailand</option>
                                                    <option value="Timor-Leste">Timor-Leste </option>
                                                    <option value="Togo">Togo</option>
                                                    <option value="Tokelau">Tokelau</option>
                                                    <option value="Tonga">Tonga </option>
                                                    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                    <option value="Tunisia">Tunisia</option>
                                                    <option value="Turkey">Turkey</option>
                                                    <option value="Turkmenistan">Turkmenistan</option>
                                                    <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                    <option value="Tuvalu">Tuvalu</option>
                                                    <option value="Uganda">Uganda</option>
                                                    <option value="Ukraine">Ukraine</option>
                                                    <option value="United Arab Emirates">United Arab Emirates</option>
                                                    <option selected value="United Kingdom">United Kingdom </option>
                                                    <option value="United States of America">United States of America</option>
                                                    <option value="United States Virgin Islands">United States Virgin Islands</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela </option>
                                                    <option value="Viet Nam">Viet Nam</option>
                                                    <option value="Wallis and Futuna Islands">Wallis and Futuna Islands </option>
                                                    <option value="Western Sahara">Western Sahara </option>
                                                    <option value="Yemen">Yemen </option>
                                                    <option value="Zambia">Zambia</option>
                                                    <option value="Zimbabwe">Zimbabwe</option>

                                                </select>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Telephone</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberTelephone" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Profession</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxProfession" placeholder="enter profession" class="form-control" type="text" name="textbox" value="" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Email</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberEmail" placeholder="person@mail.com" class="form-control" type="text" name="textbox" value="" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Age category</label>

                                    </div>
                                    <div class="col-sm-8">

                                        <div class="row">
                                            <div class="col-sm-6">

                                                <select id="selectNewMemberAgeCategory" class="form-control">
                                                    <option value="Select age category">Select age category</option>
                                                    <option value="Above 35">Above 35</option>
                                                    <option value="Children (0-12)">Children (0-12)</option>
                                                    <option value="Teenage(13-19)">Teenage(13-19)</option>
                                                    <option value="Young Adults(20-35)">Young Adults(20-35)</option>
                                                </select>

                                            </div>
                                            <div class="col-sm-6">
                                                <select id="selectMembershipType" class="form-control">
                                                    <option value="Select type of membership">Select type of membership</option>
                                                    <option value="Member">Member</option>
                                                    <option value="Non-member">Non member</option>

                                                </select>
                                            </div>

                                        </div>





                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-sm-3">
                                        <label class="form-label-control">Comment</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input id="textboxNewMemberComment" class="form-control" type="text" name="textbox" value="" placeholder="enter .." />
                                    </div>
                                </div>
                                <!-- About salvation -->
                                <b>Check and input date if known</b>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">About salvation</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">

                                            <div class="col-sm-4 font-weight-bold">


                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkIsBornAgain" value="" />
                                                BornAgain
                                                     
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date 
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxcheckIsBornAgain" value="" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">About Communion</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-sm-4 font-weight-bold">

                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkCommunicant" value="" />
                                                Communicant
                                        
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxIsCommunicant" value="" /><br />
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">About WaterBaptism</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">

                                            <div class="col-sm-4 font-weight-bold">

                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkIsWaterBaptised" value="" />
                                                WaterBaptised
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxIsWaterBaptised" value="" /><br />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">About HolySpirit</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">

                                            <div class="col-sm-4 font-weight-bold">

                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkIsHolySpiritBaptised" value="" />
                                                HolySpiritBaptised
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date 
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxIsHolySpiritBaptised" value="" /><br />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">Is New Convert</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">

                                            <div class="col-sm-4 font-weight-bold">

                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkIsNewConvertWaterBaptised" value="" />
                                                WaterBaptised
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date 
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxIsNewConvertWaterBaptised" value="" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="form-label-control ">Is Old Member</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="row">

                                            <div class="col-sm-4 font-weight-bold">


                                                <input style="width: 24px; height: 24px; position: relative; top: 6px" class="form-check-input" type="checkbox" id="checkIsOldMemberHolySpiritBaptised" value="" />
                                                HolySpiritBaptised
                                                     
                                            </div>
                                            <div class="col-sm-8 font-weight-bold">
                                                Date 
                                                    <input class="" maxlength="10" placeholder="dd/mm/yyyy" type="text" id="textboxIsOldMemberHolySpiritBaptised" value="" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                                <!-- About salvation -->
                            </div>


                            <div id="modal-footer-container" class="modal-footer">
                                <button onclick="{$rab.Membership.UpdatePersonalDetails()}" type="button" id="buttonSubmitUpdateMember" class="btn btn-secondary">Update</button>
                                <%--<button onclick="{$rab.Membership.AddNewMember()}" type="button" id="buttonSubmitNewMember" class="btn btn-secondary">Submit</button>--%>
                                <button type="button" id="buttonCloseNewMember" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->


                </div>
            </div>
        </div>


    </section>




    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/script/memberUpdateJS2.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/data-tables/jquery.data-tables.min.js"></script>
    <script src="assets/data-tables/data-tables.bootstrap4.min.js"></script>
    <script src="assets/theme/js/script.js"></script>
    <script src="assets/formoid/formoid.min.js"></script>
    <%--<script src="assets/script/AccessJS.js"></script>--%>
    <%--<script src="assets/script/membersJS.js"></script>--%>
    <%--<script src="assets/script/memberStatisticsJS.js"></script>--%>
    <script src="assets/script/memberupdateJS.js"></script>
    <%-- <script src="../assets/script/AccessJS.js"></script>--%>
    <style>
        input[name=search] {
            margin: 0px !important;
            padding: 0px !important;
            cursor: pointer;
        }

        input[type=button] {
            cursor: pointer !important;
        }

        tr {
            cursor: pointer;
        }

            tr:nth-child(2n+1) {
                background-color: #d6dbe9;
                color: black;
            }

            tr:nth-child(2n) {
                background-color: #293955;
                color: white;
            }
    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>
    <script>
        $(document).ready(function () {
            // $rab.Church.LoadBranches("selectBranchNames");

            $("#textboxsearchstring").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#tbodyMembers tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

    </script>
</body>
</html>
