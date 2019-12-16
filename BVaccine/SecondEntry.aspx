<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SecondEntry.aspx.cs" Inherits="BVaccine.WebForm3" Culture="en-GB" %>

<%@ MasterType VirtualPath="~/Main.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            font-size: medium;
        }

        .auto-style3 {
            padding-left: 15px;
            font-size: medium;
        }

        .auto-style4 {
            padding-left: 15px;
            font-size: medium;
            font-weight: bold;
        }

        .auto-style5 {
            font-size: medium;
            font-weight: bold;
        }

        .auto-style6 {
            padding-left: 15px;
            height: 61px;
        }

        .auto-style7 {
            height: 61px;
        }
        .auto-style8 {
            width: 500px;
        }
        .auto-style9 {
            width: 155px;
        }
        .auto-style11 {
            padding-left: 15px;
            width: 1705px;
        }
        .auto-style12 {
            width: 88px;
        }
        .auto-style13 {
            font-size: medium;
            width: 76px;
        }
    </style>

    <script type="text/javascript">
        function proof(id) {
            var val = document.getElementById(id).value;
            if (val != "" && (val < 1 || val > 3)) {
                alert('Invalid input value! \nThis field only takes 1, 2, 3 as input.');
                document.getElementById(id).value = "";
            }
        }

        function statusinput(id) {
            var val = document.getElementById(id).value;
            if (val != "" && (val < 1 || val > 5)) {
                alert('Invalid input value! \nThis field takes only 1 to 5 as input.');
                document.getElementById(id).value = "";
            }
        }

        function language(id) {
            var val = document.getElementById(id).value;
            if (val != "" && (val < 1 || val > 14)) {
                alert('Invalid input value! \nThis field takes only 1 to 14 as input.');
                document.getElementById(id).value = "";
            }
        }

        function input(id) {
            var val = document.getElementById(id).value;
            if (val != "" && !(val == 1 || val == 2)) {
                alert('Invalid input value! \nThis field takes only 1 or 2 as input.');
                document.getElementById(id).value = "";
            }
        }

        function vaccinationpanel(id) {
            var val = document.getElementById(id).value;
            if (val == 2) {
                var node = document.getElementById(id);
                var td = node.parentNode;
                var link = td.nextElementSibling;

                for (var i = 0; i < 3; i++) {
                    link.style.visibility = 'hidden';
                    link = link.nextElementSibling;
                }
            }
            else if (val == 1) {
                var td = document.getElementById(id).parentNode;
                var link = td.nextElementSibling;
                for (var i = 0; i < 3; i++) {
                    link.style.visibility = 'visible';
                    link = link.nextElementSibling;
                }
            }
        }

        function required() {
            if (document.getElementById("<%=txtStatus.ClientID%>").value == 1) {
                if (document.getElementById("<%=txtGender.ClientID%>").value == "") {
                    alert("Please fill in the required field");
                    document.getElementById("<%=txtGender.ClientID%>").focus();
                }
            }
        }

        //function customValidate(source, args) {

        //    if (document.getElementById("").value != 1) 
        //       //ValidatorEnable(myVal, false);

        //        alert(source + " " + arg.Value);            
        //}

        function disable(id) {
            if (id == 'txtStatus') {
                var st = document.getElementById(id).value;
                if (st != "" && (st > 1 && st < 6)) {
                    document.getElementById("<%=tblQ5.ClientID%>").style.display = 'none';
                    document.getElementById("<%=tblQ10.ClientID%>").style.display = 'none';
                    document.getElementById("<%=tbl2.ClientID%>").style.display = 'none';
                    document.getElementById("<%=tblQ19.ClientID%>").style.display = 'none';
                }
                else if (st == "" || st == 1) {
                    document.getElementById("<%=tblQ5.ClientID%>").style.display = 'block';
                    document.getElementById("<%=tblQ10.ClientID%>").style.display = 'block';
                    document.getElementById("<%=tbl2.ClientID%>").style.display = 'block';
                    document.getElementById("<%=tblQ19.ClientID%>").style.display = 'block';
                }
        }

        if (id == 'txtQ9') {
            var st = document.getElementById(id).value;
            if (st != "" && st == 2) {
                document.getElementById("<%=tblQ10.ClientID%>").style.display = 'none';
                    document.getElementById("<%=tbl2.ClientID%>").style.display = 'none';
                    document.getElementById("<%=tblQ19.ClientID%>").style.display = 'none';
                }
                else if (st == "" || st == 1) {
                    document.getElementById("<%=tblQ10.ClientID%>").style.display = 'block';
                    document.getElementById("<%=tbl2.ClientID%>").style.display = 'block';
                    document.getElementById("<%=tblQ19.ClientID%>").style.display = 'block';
                }
        }

        if (id == 'txtQ19') {
            var st = document.getElementById(id).value;
            if (st != "" && (st == 3 || st == 4)) {
                document.getElementById("<%=tblQ19.ClientID%>").style.display = 'none';
                }
                else if (st == "" || st == 1 || st == 2) {
                    document.getElementById("<%=tblQ19.ClientID%>").style.display = 'block';
                }
        }
    }

    function enable(id) {
        //alert(abc);
        var st = document.getElementById(id).value;
        //var elem = $("#id").next();
        //document.getElementById(elem).disabled = false;
        if (id == 'txtQ9') {
            if (st != "" && st == 2)
                document.getElementById("<%=txtQ9_x.ClientID%>").disabled = false;
                    else if (st == "" || st == 1)
                        document.getElementById("<%=txtQ9_x.ClientID%>").disabled = true;
                document.getElementById("<%=txtQ9_x.ClientID%>").value = "";
                }

                if (id == 'txtQ14') {
                    if (st != "" && st == 14)
                        document.getElementById("<%=txtQ14_x.ClientID%>").disabled = false;
                    else if (st == "")
                        document.getElementById("<%=txtQ14_x.ClientID%>").disabled = true;
                document.getElementById("<%=txtQ14_x.ClientID%>").value = "";
                }

                if (id == 'txtQ16') {
                    if (st != "" && st == 2)
                        document.getElementById("<%=txtQ16_x.ClientID%>").disabled = false;
                    else if (st == "" || st == 1)
                        document.getElementById("<%=txtQ16_x.ClientID%>").disabled = true;
                document.getElementById("<%=txtQ16_x.ClientID%>").value = "";
                }

                else if (id == 'txtQ20_24') {
                    if (st != "" && st == 2)
                        document.getElementById("<%=txtQ20_24x.ClientID%>").disabled = false;
                    else if (st == "" || st == 1)
                        document.getElementById("<%=txtQ20_24x.ClientID%>").disabled = true;
                document.getElementById("<%=txtQ20_24x.ClientID%>").value = "";
                }
        }

        function DaysInMonth(Y, M) {
            with (new Date(Y, M, 1, 12)) {
                setDate(0);
                return getDate();
            }
        }
        function datediff(date1, date2) {
            var y1 = date1.getFullYear(), m1 = date1.getMonth(), d1 = date1.getDate(),
            y2 = date2.getFullYear(), m2 = date2.getMonth(), d2 = date2.getDate();
            if (d1 < d2) {
                m1--;
                d1 += DaysInMonth(y2, m2);
            }
            if (m1 < m2) {
                y1--;
                m1 += 12;
            }
            return [y1 - y2, m1 - m2, d1 - d2];
        }
        function CalculateAge() {
            var dob1 = document.getElementById("txtDOB").value;
            var birthYear = parseInt(dob1.substring(6, 10));
            var birthMonth = parseInt(dob1.substring(3, 5));
            var birthDay = parseInt(dob1.substring(0, 2));
            var year;

            var dov1 = document.getElementById("txtDOV1").value;
            var visitYear = parseInt(dov1.substring(6, 10));
            var visitMonth = parseInt(dov1.substring(3, 5));
            var visitDay = parseInt(dov1.substring(0, 2));
            var year;

            birthDate = new Date(birthYear, birthMonth, birthDay);
            visitDate = new Date(visitYear, visitMonth, visitDay);

            var dife = datediff(visitDate, birthDate);
            var monleft = (dife[0] * 12) + dife[1];
            document.getElementById("LblAge").innerText = monleft + " months";
            //document.getElementById("txtAge").value = dife[0] + " years, " + dife[1] + " months, and " + dife[2] + " days";
        }

        function DateCheck(id) {
            var Check = document.getElementById(id).value;
            if (Check != "88/88/8888" && Check != "99/99/9999") {
                var dob = document.getElementById("txtDOB").value;
                var dov = document.getElementById("txtDOV1").value;

                var d1 = dob.split("/");
                var d2 = dov.split("/");
                var c = Check.split("/");

                var from = new Date(d1[2], parseInt(d1[1]) - 1, d1[0]);
                var to = new Date(d2[2], parseInt(d2[1]) - 1, d2[0]);
                var check = new Date(c[2], parseInt(c[1]) - 1, c[0]);

                if (check < from || check > to) {
                    alert('Invalid Date! \nDate must be greater than Date of Birth & less than Date of Visit.');
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
        
<div style="text-align: center; margin-top: 50px; margin-bottom: 50px">
    <h2 class="auto-style5">TOOL1: BASELINE VACCINE COVERAGE SURVEY</h2>
    <br class="auto-style2" />
    <div class="section-title container">
        <table border="1" style="text-align: center; width: 101%; margin-top: 20px; background-color: #808080; border: 1px solid #BFBFBF; color: #2C3E50; font-family: Tahoma;">

            <tr style="height: 60px; font-family: Calibri; font-size: 19px; color: white; ">
                <td style="font-weight: 600;" class="auto-style2">DSSID</td>
                <td style="text-align: left; padding-left: 15px" class="auto-style8">
                    <asp:TextBox ID="txtDSSID" runat="server" Height="31px" placeholder="dssid" MaxLength="12" style="text-transform:uppercase;" ForeColor="Black" CssClass="auto-style2" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDSSID" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegEx2" runat="server" ControlToValidate="txtDSSID" ValidationExpression="^[a-zA-Z0-9]+$" ErrorMessage="Invalid input" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td style="font-weight: 600" class="auto-style13">Study ID</td>
                <td style="text-align: left; padding-left: 15px" class="auto-style8">
                    <asp:TextBox ID="txtStudyID" Width="150px" placeholder="case id" Height="31px" runat="server" MaxLength="5" ForeColor="Black" CssClass="auto-style2" AutoPostBack="False"></asp:TextBox>
                    <span class="auto-style2">-</span>
                    <asp:TextBox ID="txtChildID" Width="40px" placeholder="id" runat="server" Height="31px" MaxLength="1" ForeColor="Black" CssClass="auto-style2" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegEx" runat="server" ControlToValidate="txtStudyID" ValidationExpression="^[0-9]+$" ErrorMessage="Invalid input" Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="Required1" runat="server" ControlToValidate="txtStudyID" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">
                    <asp:Button ID="checkButton" class="btn-primary btn-sm" runat="server" Text="Check" OnClick="checkButton_Click"  />
                </td>
            </tr>
        </table>
        <asp:Panel ID="formPanel" runat="server" Visible="False">
            <h3 style="text-align: left; margin-top: 60px" class="auto-style5">Section 1: Interview Status and Household Information</h3>

            <table id="tbl1" class="table table-hover table-responsive" style="text-align: left; width: 100%; font-size: medium; background-color: #DDDDDD; font-family: Tahoma;">

                <tr class="thStyle">
                    <td class="tdStyle"><span class="auto-style5">1.</span><span class="auto-style2"> Interviewer's Name:</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtName" runat="server" CssClass="auto-style2" style="text-transform:uppercase;" placeholder="name" Width="200"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtName" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*Invalid characters." Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RV" runat="server" ControlToValidate="txtName" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="tdStyle">Interviewer's Code:</td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtICode" Width="100px" runat="server" CssClass="auto-style2" style="text-transform:uppercase;" placeholder="code" MaxLength="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtICode" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="thStyle">
                    <td class="tdStyle"><span class="auto-style5">2.</span><span class="auto-style2"> Date of 1</span><sup><span class="auto-style2">st</span></sup><span class="auto-style2"> Visit:</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtDOV1" runat="server" ClientIDMode="Static" CssClass="auto-style2" MaxLength="10" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDOV1" />
                        <asp:CompareValidator ID="CompareDOV1" runat="server" ControlToCompare="txtDOV2" ControlToValidate="txtDOV1" Operator="LessThanEqual" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDOV1" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="tdStyle"><span class="auto-style2">Time of 1</span><sup><span class="auto-style2">st</span></sup><span class="auto-style2"> Visit</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtTOV1" Width="100px" CssClass="auto-style2" runat="server" MaxLength="5" placeholder="hh:mm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTOV1" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtTOV1" />
                </tr>
                <tr class="thStyle">
                    <td class="tdStyle"><span class="auto-style5">3.</span><span class="auto-style2"> Date of 2</span><sup><span class="auto-style2">nd</span></sup><span class="auto-style2"> Visit:</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtDOV2" runat="server" MaxLength="10" CssClass="auto-style2" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDOV2" />
                        <asp:CompareValidator ID="CompareDOV2" runat="server" ControlToValidate="txtDOV2" Operator="LessThanEqual" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator></td>
                    <td class="tdStyle"><span class="auto-style2">Time of 2</span><sup><span class="auto-style2">nd</span></sup><span class="auto-style2"> Visit</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtTOV2" Width="100px" runat="server" MaxLength="5" CssClass="auto-style2" placeholder="hh:mm"></asp:TextBox></td>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtTOV2" />
                </tr>
                <tr id="trow4" class="thStyle" runat="server">
                    <td class="tdStyle"><span class="auto-style5">4.</span><span class="auto-style2"> Status of Interview:</span></td>
                    <td colspan="3" class="tdStyle tdText">
                        <asp:TextBox ID="txtStatus" runat="server" onkeyup="disable('txtStatus'); statusinput('txtStatus')" ClientIDMode="Static" CssClass="auto-style2" type="number" MaxLength="1" placeholder="1 to 5" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtStatus" ErrorMessage="*Required Field is empty" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
            </table>

            <table id="tblQ5" runat="server" class="table table-hover" style="text-align: left; width: 100%; margin-top: 20px; font-size: 16px; background-color: #DDDDDD; font-family: Tahoma;">
                <tr id="Tr1" class="thStyle" runat="server">
                    <td id="Td1" class="tdStyle" runat="server"><b>5.</b> Gender of Child:</td>
                    <td id="Td2" colspan="3" class="tdStyle" runat="server">
                        <asp:TextBox ID="txtGender" runat="server" class="example" onkeyup="input('txtGender')" ClientIDMode="Static" MaxLength="1" CssClass="txtbxRd" placeholder="1 / 2" Width="150px"></asp:TextBox>
                        
                        <%--<asp:CustomValidator ID="CV1" class="req1" runat="server" ClientIDMode="Static" ControlToValidate="txtGender" ValidateEmptyText="true" ErrorMessage="Value is required" ClientValidationFunction="customValidate"></asp:CustomValidator>--%>
                    </td>
                </tr>
                <tr class="thStyle">
                    <td class="tdStyle"><span class="auto-style5">6.</span><span class="auto-style2"> Date of Birth:</span></td>
                    <td class="tdStyle tdText">
                        <asp:TextBox ID="txtDOB" runat="server" onblur="CalculateAge()" ClientIDMode="Static" MaxLength="10" CssClass="auto-style2" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDOB" />
                        <asp:CompareValidator ID="CompareDOB" runat="server" ControlToCompare="txtDOV1" ControlToValidate="txtDOB" Type="Date" Operator="LessThan" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator></td>
                    <td class="tdStyle" style="padding-left: 20px">Age:</td>
                    <td class="tdStyle tdText">
                        <asp:Label ID="LblAge" runat="server" ClientIDMode="Static"></asp:Label>
                        <%--<asp:TextBox ID="txtAge" Width="100px" runat="server" ClientIDMode="Static" Enabled="True" CssClass="auto-style2" MaxLength="2" placeholder="months"></asp:TextBox>--%>
                    </td>
                </tr>
                <tr class="thStyle">
                    <td colspan="2" class="tdStyle"><span class="auto-style5">7.</span><span class="auto-style2"> Is the seleted child currently availabe at home?</span></td>
                    <td colspan="2" class="tdStyle tdText">
                        <asp:TextBox ID="txtQ7" runat="server" MaxLength="1" onkeyup="input('txtQ7')" ClientIDMode="Static" CssClass="auto-style2" placeholder="1 / 2" Width="140px"></asp:TextBox></td>
                </tr>
                <tr class="thStyle">
                    <td colspan="2" class="tdStyle"><span class="auto-style5">8.</span><span class="auto-style2"> Is the parent / caregiver of the selected child availabe at home?</span></td>
                    <td colspan="2" class="tdStyle tdText">
                        <asp:TextBox ID="txtQ8" runat="server" MaxLength="1" onkeyup="input('txtQ8')" ClientIDMode="Static" CssClass="auto-style2" placeholder="1 / 2" Width="140px"></asp:TextBox></td>
                </tr>
                <tr id="trow9" runat="server" class="thStyle">
                    <td colspan="2" class="auto-style6"><span class="auto-style5">9.</span><span class="auto-style2"> Is the parent / caregiver consenting for this interview?</span></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtQ9" runat="server" onkeyup="input('txtQ9'); disable('txtQ9'); enable('txtQ9');" ClientIDMode="Static" MaxLength="1" CssClass="auto-style2" placeholder="1 / 2" Width="140px"></asp:TextBox></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtQ9_x" runat="server" onkeyup="" ClientIDMode="Static" MaxLength="2" CssClass="auto-style2" placeholder="reason" Width="120px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>

                <table id="tblQ10" runat="server" class="table table-hover" style="text-align: left; width: 100%; margin-top: 20px; font-size: 16px; background-color: #DDDDDD; font-family: Tahoma;">
                    <tr class="thStyle">
                        <td colspan="2" class="auto-style11"><span class="auto-style5">10.</span><span class="auto-style2"> Nearest EPI center to the household (to be filled by interview)</span></td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtQ10_nm" runat="server" placeholder="??" CssClass="auto-style2" MaxLength="10" Width="140px" Enabled="False"></asp:TextBox></td>
                        <td class="tdStyle tdText">
                            <asp:TextBox ID="txtQ10_code" runat="server" MaxLength="2" CssClass="auto-style2" placeholder="code" Width="120px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="2" class="auto-style11"><span class="auto-style5">11.</span><span class="auto-style2"> Approximate distance in KM of this household from EPI centre (to be filled by interviewer)</span></td>
                        <td colspan="2" class="tdStyle tdText">
                            <asp:TextBox ID="txtQ11" runat="server" placeholder="km" CssClass="auto-style2" MaxLength="2" Width="140px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="2" class="auto-style11"><span class="auto-style5">12.</span><span class="auto-style2"> To which EPI center this family usually goes to?</span></td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtQ12_nm" runat="server" placeholder="??" CssClass="auto-style2" MaxLength="10" Width="140px" Enabled="False"></asp:TextBox></td>
                        <td class="tdStyle tdText">
                            <asp:TextBox ID="txtQ12_code" runat="server" MaxLength="2" CssClass="auto-style2" placeholder="code" Width="120px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="2" class="auto-style11"><span class="auto-style5">13.</span><span class="auto-style2"> Approximate distance in KM of this household from EPI centre: </span></td>
                        <td colspan="2" class="tdStyle tdText">
                            <asp:TextBox ID="txtQ13" runat="server" placeholder="km" CssClass="auto-style2" MaxLength="2" Width="140px"></asp:TextBox></td>

                    </tr>
                    <tr class="thStyle">
                        <td colspan="2" class="auto-style11"><span class="auto-style5">14.</span><span class="auto-style2"> Which language is commonly spoken at household?</span></td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtQ14" runat="server" placeholder="1 to 14" onkeyup="enable('txtQ14'); language('txtQ14')" ClientIDMode="Static" type="number" CssClass="auto-style2" MaxLength="2" Width="140px"></asp:TextBox></td>
                        <td class="tdStyle tdText">
                            <asp:TextBox ID="txtQ14_x" runat="server" CssClass="auto-style2" ClientIDMode="Static" placeholder="if 14 then code" MaxLength="2" Width="125px" Enabled="False"></asp:TextBox></td>
                    </tr>
                </table>
            
                    <div id="tbl2" runat="server">
                        <h3 style="text-align: left; margin-top: 60px" class="auto-style5">Section 2: VACCINATION INFORMATION </h3>
                        <h4 style="text-align: left;" class="auto-style2">(First, ask the mother or caregiver to get the child's medical / vaccination record / card. If no card is availabe, take the vaccination history)</h4>

                        <table class="table table-hover" style="text-align: left; width: 100%; margin-top: 20px; font-size: 16px; background-color: #DDDDDD; font-family: Tahoma;">
                            <tr class="thStyle">
                                <td colspan="3" class="tdStyle"><span class="auto-style5">15.</span><span class="auto-style2"> Is BCG mark is present</span></td>
                                <td colspan="3" class="tdStyle tdText">
                                    <%--<asp:RadioButtonList ID="radio15" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>--%>
                                    <asp:TextBox ID="txtQ15" runat="server" placeholder="1 to 2" onkeyup="input('txtQ15')" ClientIDMode="Static" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>


                            <tr class="thStyle">
                                <td colspan="3" class="tdStyle"><span class="auto-style5">16.</span><span class="auto-style2"> Is vaccination card available?</span></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <%--<asp:RadioButtonList ID="radio16" runat="server">
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>--%>
                                    <asp:TextBox ID="txtQ16" runat="server" placeholder="1 to 2" onkeyup="enable('txtQ16'); input('txtQ16');" ClientIDMode="Static" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ16_x" runat="server" placeholder="if 2 then code" ClientIDMode="Static" CssClass="auto-style2" MaxLength="2" Width="125px" Enabled="False"></asp:TextBox></td>
                            </tr>


                            <tr class="thStyle" style="background-color: gray; height: 30px;">
                                <td colspan="6"></td>
                            </tr>


                            <tr class="thStyle">
                                <td colspan="1" class="auto-style4">17.</td>
                                <td colspan="1" class="auto-style4">Vaccine</td>
                                <td colspan="1" class="auto-style3">Yes / No</td>
                                <td colspan="1" class="tdStyle"><b><span class="auto-style2">Date</span></b><span class="auto-style2">
                                    <br />
                                    (88/88/8888, if card is present,<br />
                                    but date not mentioned)<br />
                                    (99/99/9999, if date not remember)</span></td>
                                <td colspan="1" class="auto-style3">Card/History/Both</td>
                                <td colspan="1" class="auto-style3">Source</td>
                            </tr>




                            <tr class="thStyle">
                                <td colspan="1" rowspan="2" class="auto-style4">At Birth</td>
                                <td colspan="1" class="auto-style3">BCG (Right Arm)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtimbcg" runat="server" onkeyup="input('txtimbcg'); vaccinationpanel('txtimbcg')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText sibling">
                                    <asp:TextBox ID="txtimbcg_dt" runat="server" onblur="DateCheck('txtimbcg_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtimbcg_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtimbcg_prf" runat="server" onkeyup="proof('txtimbcg_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtimbcg_src" runat="server" onkeyup="statusinput('txtimbcg_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">OPV0 (Oral drops)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv0" runat="server" onkeyup="input('txtopv0'); vaccinationpanel('txtopv0')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv0_dt" runat="server" onblur="DateCheck('txtopv0_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender7" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtopv0_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv0_prf" runat="server" onkeyup="proof('txtopv0_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv0_src" runat="server" onkeyup="statusinput('txtopv0_src')" ClientIDMode="Static" placeholder="code" MaxLength="2" CssClass="auto-style2" Width="125px"></asp:TextBox></td>
                            </tr>




                            <tr class="thStyle">
                                <td colspan="1" rowspan="3" class="auto-style4">6 weeks</td>
                                <td colspan="1" class="auto-style3">OPV1 (Oral drops)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv1" runat="server" onkeyup="input('txtopv1'); vaccinationpanel('txtopv1')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv1_dt" runat="server" onblur="DateCheck('txtopv1_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender8" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtopv1_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv1_prf" runat="server" onkeyup="proof('txtopv1_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv1_src" runat="server" onkeyup="statusinput('txtopv1_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">Penta1 (Right thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp1" runat="server" onkeyup="input('txtp1'); vaccinationpanel('txtp1')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp1_dt" runat="server" onblur="DateCheck('txtp1_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender9" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtp1_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp1_prf" runat="server" onkeyup="proof('txtp1_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp1_src" runat="server" onkeyup="statusinput('txtp1_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">PCV1 (Left thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv1" runat="server" onkeyup="input('txtpcv1'); vaccinationpanel('txtpcv1')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv1_dt" runat="server" onblur="DateCheck('txtpcv1_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender10" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtpcv1_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv1_prf" runat="server" onkeyup="proof('txtpcv1_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv1_src" runat="server" onkeyup="statusinput('txtpcv1_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>



                            <tr class="thStyle">
                                <td colspan="1" rowspan="3" class="auto-style4">10 weeks</td>
                                <td colspan="1" class="auto-style3">OPV2 (Oral drops)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv2" runat="server" onkeyup="input('txtopv2'); vaccinationpanel('txtopv2')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv2_dt" runat="server" onblur="DateCheck('txtopv2_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender11" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtopv2_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv2_prf" runat="server" onkeyup="proof('txtopv2_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv2_src" runat="server" onkeyup="statusinput('txtopv2_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">Penta2 (Right thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp2" runat="server" onkeyup="input('txtp2'); vaccinationpanel('txtp2')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp2_dt" runat="server" onblur="DateCheck('txtp2_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtp2_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp2_prf" runat="server" onkeyup="proof('txtp2_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp2_src" runat="server" onkeyup="statusinput('txtp2_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">PCV2 (Left thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv2" runat="server" onkeyup="input('txtpcv2'); vaccinationpanel('txtpcv2')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv2_dt" runat="server" onblur="DateCheck('txtpcv2_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender13" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtpcv2_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv2_prf" runat="server" onkeyup="proof('txtpcv2_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv2_src" runat="server" onkeyup="statusinput('txtpcv2_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>



                            <tr class="thStyle">
                                <td colspan="1" rowspan="4" class="auto-style4">14 weeks</td>
                                <td colspan="1" class="auto-style3">OPV3 (Oral drops)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv3" runat="server" onkeyup="input('txtopv3'); vaccinationpanel('txtopv3')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv3_dt" runat="server" onblur="DateCheck('txtopv3_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender14" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtopv3_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv3_prf" runat="server" onkeyup="proof('txtopv3_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtopv3_src" runat="server" onkeyup="statusinput('txtopv3_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">Penta3 (Right thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp3" runat="server" onkeyup="input('txtp3'); vaccinationpanel('txtp3')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp3_dt" runat="server" onblur="DateCheck('txtp3_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender15" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtp3_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp3_prf" runat="server" onkeyup="proof('txtp3_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtp3_src" runat="server" onkeyup="statusinput('txtp3_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">PCV3 (Left thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv3" runat="server" onkeyup="input('txtpcv3'); vaccinationpanel('txtpcv3')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv3_dt" runat="server" onblur="DateCheck('txtpcv3_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender16" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtpcv3_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv3_prf" runat="server" onkeyup="proof('txtpcv3_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtpcv3_src" runat="server" onkeyup="statusinput('txtpcv3_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="1" class="auto-style3">IPV (Left thigh)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtipv" runat="server" onkeyup="input('txtipv'); vaccinationpanel('txtipv')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtipv_dt" runat="server" onblur="DateCheck('txtipv_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender17" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtipv_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtipv_prf" runat="server" onkeyup="proof('txtipv_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtipv_src" runat="server" onkeyup="statusinput('txtipv_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>



                            <tr class="thStyle">
                                <td colspan="1" class="auto-style4">9 months</td>
                                <td colspan="1" class="auto-style3">Measles1 (Left Arm)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm1" runat="server" onkeyup="input('txtm1'); vaccinationpanel('txtm1')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm1_dt" runat="server" onblur="DateCheck('txtm1_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender18" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtm1_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm1_prf" runat="server" onkeyup="proof('txtm1_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm1_src" runat="server" onkeyup="statusinput('txtm1_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>


                            <tr class="thStyle">
                                <td colspan="1" class="auto-style4">15 months</td>
                                <td colspan="1" class="auto-style3">Measles2 (Left Arm)</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm2" runat="server" onkeyup="input('txtm2'); vaccinationpanel('txtm2')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm2_dt" runat="server" onblur="DateCheck('txtm2_dt')" ClientIDMode="Static" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="150px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender19" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtm2_dt" /></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm2_prf" runat="server" onkeyup="proof('txtm2_prf')" ClientIDMode="Static" type="number" placeholder="1 / 2 / 3" CssClass="auto-style2" MaxLength="1" Width="125px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtm2_src" runat="server" onkeyup="statusinput('txtm2_src')" ClientIDMode="Static" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="125px"></asp:TextBox></td>
                            </tr>



                            <tr class="thStyle" style="background-color: gray; height: 30px">
                                <td colspan="6"></td>
                            </tr>


                            <tr class="thStyle">
                                <td colspan="4" class="tdStyle"><span class="auto-style5">18.</span><span class="auto-style2"> Who at household level, decides about vaccination of child / children?</span></td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ18" runat="server" onkeyup="language('txtQ18');" ClientIDMode="Static" placeholder="1 to 11" type="number" CssClass="auto-style2" MaxLength="2" Width="140px"></asp:TextBox></td>
                            </tr>


                            <tr id="trow19" runat="server" class="thStyle">
                                <td colspan="4" class="tdStyle"><span class="auto-style5">19.</span><span class="auto-style2"> Immunization status</span></td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ19" runat="server" onkeyup="statusinput('txtQ19'); disable('txtQ19');" ClientIDMode="Static" placeholder="1 to 4" type="number" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                        </table>
                    </div>  

                    <table id="tblQ19" runat="server" class="table table-hover" style="text-align: left; width: 100%; margin-top: 20px; font-size: 16px; background-color: #DDDDDD; font-family: Tahoma;">
                            <tr class="thStyle">
                                <td colspan="6" class="tdStyle"><span class="auto-style5">20.</span><span class="auto-style2"> Identify the reason that why a child is partially vaccinated at all vaccinated at all (Multiple responses allowed)</span></td>
                            </tr>
                            <tr class="thStyle" style="background-color: gray; color: white; height: 40px">
                                <td colspan="4" class="auto-style4" style="text-align: center;">Reason</td>
                                <td colspan="2" class="auto-style3">Yes / No</td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">1. Lack of awareness / knowledge</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_1" runat="server" onkeyup="input('txtQ20_1')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">2. Fear of injection administration / pain to child</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_2" runat="server" onkeyup="input('txtQ20_2')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">3. Don't consider that vaccine is important</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_3" runat="server" onkeyup="input('txtQ20_3')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">4. Family is busy in a day to day activities</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_4" runat="server" onkeyup="input('txtQ20_4')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">5. Fear of vaccine related reaction</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_5" runat="server" onkeyup="input('txtQ20_5')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>

                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">6. Family is against vaccination</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_6" runat="server" onkeyup="input('txtQ20_6')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>

                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">7. Cost of vaccine</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_7" runat="server" onkeyup="input('txtQ20_7')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>

                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">8. Vaccination center is too far</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_8" runat="server" onkeyup="input('txtQ20_8')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">9. Cost of transportation to reach vaccination center</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_9" runat="server" onkeyup="input('txtQ20_9')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">10. Not aware that vaccination center is available</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_10" runat="server" onkeyup="input('txtQ20_10')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">11. Religious myths / misconceptions</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_11" runat="server" onkeyup="input('txtQ20_11')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">12. Not satisfied with vaccination services / staff behaviour</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_12" runat="server" onkeyup="input('txtQ20_12')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">13. Not aware or forget about vaccination schedule</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_13" runat="server" onkeyup="input('txtQ20_13')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">14. Forget that child has to be vaccinated</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_14" runat="server" onkeyup="input('txtQ20_14')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">15. Went, but services / staff / vaccine was not available</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_15" runat="server" onkeyup="input('txtQ20_15')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">16. Consider that vaccines are not safe or it is harmful</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_16" runat="server" onkeyup="input('txtQ20_16')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">17. Too frequent dosing schedule</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_17" runat="server" onkeyup="input('txtQ20_17')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">18. Too many vaccines to admnister to one child</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_18" runat="server" onkeyup="input('txtQ20_18')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">19. Child was sick therefore did not go for vaccination</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_19" runat="server" onkeyup="input('txtQ20_19')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">20. Want vaccination at home</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_20" runat="server" onkeyup="input('txtQ20_20')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">21. Child previously developed side effects with vaccines</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_21" runat="server" onkeyup="input('txtQ20_21')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">22. Vaccine quality is poor or cold chain issue</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_22" runat="server" onkeyup="input('txtQ20_22')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">23. Assume that polio vaccine is the only vaccine</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_23" runat="server" onkeyup="input('txtQ20_23')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">24. Other</td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_24" runat="server" onkeyup="input('txtQ20_24'); enable('txtQ20_24')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                                <td colspan="1" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_24x" runat="server" placeholder="code" CssClass="auto-style2" MaxLength="2" Width="140px" Enabled="False"></asp:TextBox></td>
                            </tr>
                            <tr class="thStyle">
                                <td colspan="4" class="auto-style3">25. No reason given</td>
                                <td colspan="2" class="tdStyle tdText">
                                    <asp:TextBox ID="txtQ20_25" runat="server" onkeyup="input('txtQ20_25')" ClientIDMode="Static" placeholder="1 / 2" CssClass="auto-style2" MaxLength="1" Width="140px"></asp:TextBox></td>
                            </tr>
                        </table>
                                                              

                <table id="endtable" class="table table-hover table-reponsive" style="text-align: left; width: 100%; margin-top: 0px; font-size: 16px; background-color: #DDDDDD; font-family: Tahoma;">

                    <tr class="thStyle" style="background-color: gray; height: 30px">
                        <td colspan="6"></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="auto-style3">21. Interview end time</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtET" runat="server" placeholder="hh:mm" CssClass="auto-style2" required="required" MaxLength="4" Width="140px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender23" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtET" /></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="auto-style3">22. Date form check</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtFD" runat="server" placeholder="dd/mm/yyyy" CssClass="auto-style2" required="required" MaxLength="10" Width="140px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender20" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtFD" />
                            <asp:CompareValidator ID="CompareFD" runat="server" ControlToCompare="txtDOV2" ControlToValidate="txtFD" Operator="LessThanEqual" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="auto-style3">23. Quality checked by name/code</td>
                        <%--<td colspan="2" class="tdStyle tdText">
                            <asp:TextBox ID="txtQC" runat="server" placeholder="name" CssClass="auto-style2" MaxLength="15" Width="140px"></asp:TextBox></td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtQC" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*Invalid characters." Font-Size="Smaller" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtQC" runat="server" style="text-transform:uppercase;" placeholder="code" CssClass="auto-style2" required="required" MaxLength="4" Width="140px"></asp:TextBox></td>
                                       
                    </tr>
                    <%--<tr class="thStyle">
                        <td colspan="3" class="auto-style3">24. Entry date</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtED" runat="server" placeholder="dd/mm/yyyy" CssClass="auto-style2" MaxLength="10" Width="140px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender22" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtED" />
                            <asp:CompareValidator ID="CompareED" runat="server" ControlToValidate="txtED" Operator="LessThanEqual" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:CompareValidator></td>
                    </tr>--%>
                </table>
            <br />

            <asp:Button ID="Btnsbmt" runat="server" Text="Submit" class="btn-lg btn-primary" Width="20%" OnClick="Btnsbmt_Click" />
        </asp:Panel>
    </div>
</div>



            <%--<div class="footer" style="margin-bottom:;">
        <div class="row">
            <div class="auto-style1">&copy; Copyright at <a href="http://www.vitalpakistantrust.org/">VITAL PAKISTAN TRUST (VPT)</a>, All rights reserved. 2017-18  <%--&nbsp&nbsp  || &nbsp&nbsp  App. Developed by M.Kashif</div>
        </div>
    </div>--%>
        
</asp:Content>