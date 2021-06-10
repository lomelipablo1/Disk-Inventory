                <%--------------------------------------------------------------| 
				|Date: 11/9/16													|
                |																|
                |Programmer: Pablo Lomeli										|
                |																|
                |Notes: This is the borrower page that takes the data needed for|                                             
                |putting data into the database. The skin is used on the button.|
                |The theme is also replacing some styles like the labels.       |
                |                                                               |
                |Update(11/17/16): Fixed some validation logic issues and implem|
                |ented error label for submitting data into the DB.             |
                |																|
                |Update(12/2/16): Integrated a list view feature into website to|
                |view database items. Every aspect of this site has validation. |
                |                                                               |
                |																|
                |Update(12/8/16): Nothing new.                                  |
                |---------------------------------------------------------------%>

<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="borrower.aspx.cs" Inherits="borrower" %>

<asp:Content id="Content1" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <h1>Welcome to the Borrower page!</h1>

    <asp:ListView ID="ListView1" OnPreRender="Not_Page_Load" runat="server" DataKeyNames="borrower_id" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="phone_numLabel" runat="server" Text='<%# Bind("phone_num") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="true" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />

                    <asp:RequiredFieldValidator ID="reqfield1" ControlToValidate="fnameTextBox" CssClass="" ValidationGroup="" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="regexpress1" runat="server" ControlToValidate="fnameTextBox"
         ValidationExpression="^[A-Za-z]+$" ValidationGroup="" >
        <p class="validate">Please put in only characters.</p>

    </asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />

                    <asp:RequiredFieldValidator ID="reqfield2" ControlToValidate="lnameTextBox" CssClass="" ValidationGroup="" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="regexpress2" runat="server" ControlToValidate="lnameTextBox"
         ValidationExpression="^[A-Za-z]+$" ValidationGroup="" >
        <p class="validate">Please put in only characters.</p>

    </asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="phone_numTextBox" runat="server" Text='<%# Bind("phone_num") %>' />

                    <asp:RequiredFieldValidator ID="reqfield3" ControlToValidate="phone_numTextBox" CssClass="" ValidationGroup="" runat="server" ><p class="validate">Please put in a phone number</p></asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="regexpress3" ControlToValidate="phone_numTextBox" runat="server" 
        ValidationExpression="\d{3}-\d{3}\d{4}" ValidationGroup="" >
        <p class="validate">Use this format: 999-9999999</p>

    </asp:RegularExpressionValidator>

                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="none" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="none" />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="phone_numLabel" runat="server" Text='<%# Bind("phone_num") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">borrower_id</th>
                                <th runat="server">fname</th>
                                <th runat="server">lname</th>
                                <th runat="server">phone_num</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="phone_numLabel" runat="server" Text='<%# Bind("phone_num") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" DeleteCommand="DELETE FROM [borrower] WHERE [borrower_id] = @original_borrower_id" InsertCommand="INSERT INTO [borrower] ([fname], [lname], [phone_num]) VALUES (@fname, @lname, @phone_num)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [borrower_id], [fname], [lname], [phone_num] FROM [borrower]" UpdateCommand="UPDATE [borrower] SET [fname] = @fname, [lname] = @lname, [phone_num] = @phone_num WHERE [borrower_id] = @original_borrower_id AND [fname] = @original_fname AND [lname] = @original_lname AND [phone_num] = @original_phone_num">
        <DeleteParameters>
            <asp:Parameter Name="original_borrower_id" Type="Int32" />
            <asp:Parameter Name="original_fname" Type="String" />
            <asp:Parameter Name="original_lname" Type="String" />
            <asp:Parameter Name="original_phone_num" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="phone_num" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="phone_num" Type="String" />
            <asp:Parameter Name="original_borrower_id" Type="Int32" />
            <asp:Parameter Name="original_fname" Type="String" />
            <asp:Parameter Name="original_lname" Type="String" />
            <asp:Parameter Name="original_phone_num" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <p>Please put the name of the borrower and number, then press the CD button to submit.</p>

    <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <br />
    <section><asp:RequiredFieldValidator ID="requiredfieldvalidator1" ControlToValidate="TextBox1" CssClass="" ValidationGroup="data" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
         ValidationExpression="^[A-Za-z]+$" ValidationGroup="data" >
        <p class="validate">Please put in only characters.</p>

    </asp:RegularExpressionValidator></section>
    

    <br />

    <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

    <br />

    <section><asp:RequiredFieldValidator ID="requiredfieldvalidator2" ControlToValidate="TextBox2" CssClass="" ValidationGroup="data" runat="server" ><p class="validate">Please put in text.</p></asp:RequiredFieldValidator>

    

    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
         ValidationExpression="^[A-Za-z]+$" ValidationGroup="data" CssClass="validator" >
        <p class="validate">Please put in only characters.</p>

    </asp:RegularExpressionValidator></section>

    <br />

    <asp:Label ID="Label3" runat="server" Text="Phone Number" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><span>Format Requirement: 999-999999</span>

    <br />

    <section><asp:RequiredFieldValidator ID="requiredfieldvalidator3" ControlToValidate="TextBox3" CssClass="" ValidationGroup="data" runat="server" ><p class="validate">Please put in a phone number</p></asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TextBox3" runat="server" 
        ValidationExpression="\d{3}-\d{3}\d{4}" ValidationGroup="data" >
        <p class="validate">Use this format: 999-9999999</p>

    </asp:RegularExpressionValidator></section>

    <br />

    <asp:imagebutton ID="Button1" runat="server" SkinID="questionMark" cssclass="button" ValidationGroup="data" OnClick="Button1_Click" />
    <br />You are logged in.
    <asp:Button Text="Sign Out" runat="server" id="cmdSignOut" onclick="cmdSignOut_ServerClick" />

    <br />

    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    
</asp:Content>