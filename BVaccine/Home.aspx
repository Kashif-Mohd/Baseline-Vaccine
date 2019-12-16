<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BVaccine.WebForm1" %>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	   
    <div class="jumbotron" style="height:270px;background-color:#D3D3D3;">  <%--#4183D7--%> 
    
    <div class="section-title container" >
          
	    <h1 style="color:white; margin-top:80px">Maamta Trial LW (Compliance)</h1>
        <%--<h2 style="color:#c0d42f; text-align:center">Children Vaccines Application</h2>--%>
	</div>
    </div>
    
    <%--<div class="form-group" style="margin: 0 auto;width: 100px; ">
        <div class="form-group" ><label>DSSID</label><asp:TextBox ID="txtDSSID" runat="server" class="form-control"  MaxLength="15" Height="31px" placeholder="dssid"></asp:TextBox></div>
        <div class="form-group" ><label>StudyID</label><asp:TextBox ID="txtStudyID" class="form-control"  placeholder="case id" Height="31px" runat="server" MaxLength="5" type="number" ForeColor="Black"></asp:TextBox></div>
        <br /><asp:Button runat="server" class="btn btn-lg btn-grey" Text="submit"/>
    </div>--%>
     
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- Footer -->
        <div class="footer" style="bottom:0;position:absolute;width:100%">
            <div class="container">

                <%--<div class="row">
                    <div class="col-footer col-md-4 col-xs-6">
                        <h3>Contact Us</h3>
                        <p class="contact-us-details">
                            <b>Address:</b> House # L-26, Block # 17, K.D.A. Scheme # 24, Gulshan-e-Iqbal, Karachi.<br />
                            <b>Phone:</b> (+92) 21-34800032 - 33<br />
                            <b>Email:</b> <a href="mailto:info@vitalpakistantrust.org">info@vitalpakistantrust.org</a>
                        </p>
                    </div>

                    <div class="col-footer col-md-4 col-xs-6">
                        <h3>Our Vision</h3>
                        <p>To contribute to a healthy and prosperous Pakistan, by promoting health and well-being of Pakistani mothers and children, through vaccines and other interventions for advancing lives.</p>
                    </div>
                    <div class="col-footer col-md-4 col-xs-6">
                        <h3>Mission Statement</h3>
                        <p>To improve the well-being of mothers and children in Pakistan.</p>
                    </div>
                </div>--%>

                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-copyright">&copy; Copyright at <a href="http://www.vitalpakistantrust.org/">VITAL PAKISTAN TRUST (VPT)</a>, All rights reserved. 2017-18  <%--&nbsp&nbsp  || &nbsp&nbsp  App. Developed by M.Kashif--%></div>
                    </div>
                </div>
            </div>
        </div>   

    </asp:Content>