                <%--------------------------------------------------------------| 
				|Date: 12/8/16													|
                |																|
                |Programmer: Pablo Lomeli										|
                |																|
                |Notes: This is the login page. login: User1 Pass: User1        |
                |---------------------------------------------------------------%>

<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="logon.aspx.cs" Inherits="Default2" %>

<asp:Content id="Content1" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <h3>
   Logon Page
</h3>
<table>
   <tr>
      <td>Email:</td>
      <td><input id="txtUserName" type="text" runat="server" /></td>
      <td><ASP:RequiredFieldValidator ControlToValidate="txtUserName"
           Display="Static" ErrorMessage="*" runat="server" 
           ID="vUserName" /></td>
   </tr>
   <tr>
      <td>Password:</td>
      <td><input id="txtUserPass" type="password" runat="server" /></td>
      <td><ASP:RequiredFieldValidator ControlToValidate="txtUserPass"
          Display="Static" ErrorMessage="*" runat="server" 
          ID="vUserPass" />
      </td>
   </tr>
   <tr>
      <td>Persistent Cookie:</td>
      <td><ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" /></td>
      <td></td>
   </tr>
</table>
    <asp:Button Text="Login" runat="server" id="cmdLogin" onclick="cmdLogin_ServerClick" />
    <p></p>
<asp:Label id="lblMsg" ForeColor="red" Font-Size="10" runat="server" />

</asp:Content>