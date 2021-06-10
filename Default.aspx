                <%--------------------------------------------------------------| 
				|Date: 11/9/16													|
                |																|
                |Programmer: Pablo Lomeli										|
                |																|
                |Notes: This is the home page, nothing special here.            |
                |																|
                |Update(11/17/16): Nothing new on this page.                    |
                |																|
                |Update(12/2/16): Nothing new was added.                        |
                |																|
                |Update(12/8/16): Nothing new.                                  |
                |---------------------------------------------------------------%>

<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content id="Content1" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <h1>Welcome to the Home page!</h1>

    <p>This is a website for you to enter disk information.</p>
    <br />You are logged in.
    <asp:Button Text="Sign Out" runat="server" id="cmdSignOut" onclick="cmdSignOut_ServerClick" />
</asp:Content>