                <%--------------------------------------------------------------| 
				|Date: 11/9/16													|
                |																|
                |Programmer: Pablo Lomeli										|
                |																|
                |Notes: This is the disk page. Skin is used on the button.      |
                |                                                               |
                |Update(11/17/16): Fixed some validation logic issues and implem|
                |ented error label for submitting data into the DB.             |
                |																|
                |Update(12/2/16): Integrated a grid view feature into website to|
                |view database items. Every aspect of this site has validation. |
                |																|
                |Update(12/8/16): Nothing new.                                  |
                |---------------------------------------------------------------%>
                

<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="disk.aspx.cs" Inherits="disk" %>

<asp:Content id="Content1" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <h1>Welcome to the Disk page!</h1>


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="281px" DataKeyNames="disk_id">
        <Columns>
            <asp:TemplateField HeaderText="disk_id" InsertVisible="False" SortExpression="disk_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("disk_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("disk_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="disk_name" SortExpression="disk_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="release_date" SortExpression="release_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("release_date","{0:yyyy-M-dd}") %>'></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" CssClass="validator" ControlToValidate="TextBox1" ValidationGroup="">
                <p class="validate">Please put in a date.</p>
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regularexpression11" runat="server" ControlToValidate="TextBox1" ValidationGroup="" ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" CssClass="validator" > <p class="validate">Must use this format:yyyy-mm-dd.</p></asp:RegularExpressionValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("release_date","{0:yyyy-M-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [disk_id], [disk_name], [release_date] FROM [disk]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [disk] WHERE [disk_id] = @original_disk_id" InsertCommand="INSERT INTO [disk] ([disk_name], [release_date]) VALUES (@disk_name, @release_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [disk] SET [disk_name] = @disk_name, [release_date] = @release_date WHERE [disk_id] = @original_disk_id AND (([disk_name] = @original_disk_name) OR ([disk_name] IS NULL AND @original_disk_name IS NULL)) AND [release_date] = @original_release_date">
        <DeleteParameters>
            <asp:Parameter Name="original_disk_id" Type="Int32" />
            <asp:Parameter Name="original_disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="original_release_date" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="original_disk_id" Type="Int32" />
            <asp:Parameter Name="original_disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="original_release_date" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <p>Please enter the information for the disk.</p>
    <asp:Label ID="Label1" runat="server" Text="Genre" CssClass="validator"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" >
        <asp:ListItem Text="Rap" Value="1"></asp:ListItem>
        <asp:ListItem Text="Jazz" Value="2"></asp:ListItem>
        <asp:ListItem Text="Groovey" Value="3"></asp:ListItem>
        <asp:ListItem Text="Bumpin" Value="4"></asp:ListItem>
        <asp:ListItem Text="Jam Material" Value="5"></asp:ListItem>
        <asp:ListItem Text="Bangers" Value="6"></asp:ListItem>
        <asp:ListItem Text="Vocals" Value="7"></asp:ListItem>
        <asp:ListItem Text="R&B" Value="8"></asp:ListItem>
        <asp:ListItem Text="Soul Rap" Value="9"></asp:ListItem>

    </asp:DropDownList><br />

    <asp:Label ID="Label2" runat="server" Text="Status" CssClass="validator"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem Text="Stored" Value="1"></asp:ListItem>
        <asp:ListItem Text="Borrowed" Value="2"></asp:ListItem>
        <asp:ListItem Text="Lost" Value="3"></asp:ListItem>
    </asp:DropDownList><br />

    <asp:Label ID="Label3" runat="server" Text="Disk Type" CssClass="validator"></asp:Label>
    <asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem Text="Music" Value="1"></asp:ListItem>
        <asp:ListItem Text="Movie" Value="2"></asp:ListItem>
    </asp:DropDownList><br />

    <asp:Label ID="Label4" runat="server" Text="Disk Name" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <section><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validator" ControlToValidate="TextBox1" ValidationGroup="data">
                <p class="validate">Please put in a name.</p>
    </asp:RequiredFieldValidator></section>

    <br />


    <asp:Label ID="Label5" runat="server" Text="Release Date" CssClass="validator"></asp:Label>
    <asp:TextBox ID="TextBox2" text="" runat="server"></asp:TextBox><span>Required Format: yyyy-mm-dd</span>

    <br />
    <section>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validator" ControlToValidate="TextBox2" ValidationGroup="data">
                <p class="validate">Please put in a date.</p>
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regularexpression1" runat="server" ControlToValidate="TextBox2" ValidationGroup="data" ValidationExpression="(20\d{2})-(\d{2})-(\d{2})" CssClass="validator" > <p class="validate">Must use this format:yyyy-mm-dd.</p></asp:RegularExpressionValidator>
    </section>
    
    <br />
        
    <asp:imagebutton ID="Button1" runat="server" SkinID="questionMark" CssClass="button" ValidationGroup="data" OnClick="Button1_Click" />
    <br />You are logged in.
    <asp:Button Text="Sign Out" runat="server" id="cmdSignOut" onclick="cmdSignOut_ServerClick" />

    <br />

    <asp:Label ID="lblMessage" runat="server" CssClass="validator" Text=""></asp:Label>
    
</asp:Content>