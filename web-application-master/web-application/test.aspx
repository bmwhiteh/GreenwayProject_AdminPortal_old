﻿<%-- Name: Test
    Edits:
          - 8/23/2017 Andrea Moorman
                I'm pretty sure that this tests if the database is connected properly.  I think.  
   --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="web_application.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">
    <input type="button" id="btn" value="submit" 
        OnServerClick="DBConnectTest"
       runat="server" />

    <div>
        Accounts:
        <%=sqlData%>
    </div>
</asp:Content>
