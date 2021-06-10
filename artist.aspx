                <%--------------------------------------------------------------| 
				|Date: 11/9/16													|
                |																|
                |Programmer: Pablo Lomeli										|
                |																|
                |Notes: This is the artist page to enter artist data. The theme |
                |can be seen on the labels as well here and the button.         |
                |                                                               |
                |Update(11/17/16): Fixed some validation logic issues and implem|
                |ented error label for submitting data into the DB.             |
                |																|
                |Update(12/2/16): Integrated a form view feature into website to|
                |view database items. Every aspect of this site has validation. |
                |																|
                |Update(12/8/16): Nothing new.                                  |
                |---------------------------------------------------------------%>

<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="artist.aspx.cs" Inherits="artist" %>

<asp:Content id="Content1" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <h1>Welcome to the Artist page!</h1>

    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="artist_id" DataSourceID="SqlDataSource1" >
        <EditItemTemplate>
            artist_id:
            <asp:Label ID="artist_idLabel1" runat="server" Text='<%# Eval("artist_id") %>' />
            <br />
            fname:
            <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
            <asp:RequiredFieldValidator ID="reqfield1" ControlToValidate="fnameTextBox" CssClass="" ValidationGroup="data1" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>
            <br />
            lname:
            <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            fname:
            <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
            <br />
            <asp:RequiredFieldValidator ID="reqfield2" ControlToValidate="fnameTextBox" CssClass="" ValidationGroup="data2" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>
            <br />
            lname:
            <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            artist_id:
            <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
            <br />
            fname:
            <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
            <br />
            lname:
            <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" DeleteCommand="DELETE FROM [artist] WHERE [artist_id] = @original_artist_id" InsertCommand="INSERT INTO [artist] ([fname], [lname]) VALUES (@fname, @lname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [artist_id], [fname], [lname] FROM [artist]" UpdateCommand="UPDATE [artist] SET [fname] = @fname, [lname] = @lname WHERE [artist_id] = @original_artist_id AND [fname] = @original_fname AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_artist_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="original_artist_id" Type="Int32" />
            <asp:Parameter Name="original_fname" Type="String" />
            <asp:Parameter Name="original_lname" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--
    <p>Please enter the artist's name you would like to add and confirm by pressing the CD button.</p>

    <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="requiredfieldvalidator1" ControlToValidate="TextBox1" CssClass="" ValidationGroup="data" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>
 
    <br />

    <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    
    <br />

    <asp:imagebutton ID="Button1" runat="server"  SkinID="questionMark" CssClass="button" ValidationGroup="data" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    -->
    <br />You are logged in.
    <asp:Button Text="Sign Out" runat="server" id="cmdSignOut" onclick="cmdSignOut_ServerClick" />
</asp:Content>