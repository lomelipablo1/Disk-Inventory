/*--------------------------------------------------------------| 
|Date: 11/18/16													|
|																|
|Programmer: Pablo Lomeli										|
|																|
|Notes: This file contains code for procedures for putting the  |
|data inputted by a user into the database and checks for errors|
|and for inserting data into a database.                        |																
|                                                               |
|																|
|Update(12/2/16):Added new method for postback alternative.     |
|																|
|Update(12/8/16): Nothing new.                                  |
|---------------------------------------------------------------*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class borrower : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void cmdSignOut_ServerClick(object sender, System.EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("logon.aspx", true);
    }

    protected void Not_Page_Load(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }

    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            // Declare objects
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            // Initialize connection
            conn = new SqlConnection(
                    "Server=localhost\\sqldev01;Database=disk_inventory;User Id=sa; Password=Pa$$w0rd;");

            // *** Write the Insert command
            comm = new SqlCommand(
                "INSERT INTO [dbo].[borrower]" +
                "([fname],[lname],[phone_num])" +
                "VALUES (@fname,@lname,@phone_num)", conn);

            // *** Add the remaining parameters
            comm.Parameters.Add("@fname", System.Data.SqlDbType.Text);
            comm.Parameters["@fname"].Value = TextBox1.Text;
            comm.Parameters.Add("@lname", System.Data.SqlDbType.Text);
            comm.Parameters["@lname"].Value = TextBox2.Text;
            comm.Parameters.Add("@phone_num", System.Data.SqlDbType.Text);
            comm.Parameters["@phone_num"].Value = TextBox3.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                reader = comm.ExecuteReader();

                // Close the reader and the connection
                reader.Close();

                // Display completed message
                lblMessage.Text = "Thank you for your request.<br />" +
                  "We will get back to you within 24 hours.";

            }
            catch (SqlException ex)
            {
                string str;
                str = "Source:" + ex.Source;
                str += "\n" + "Number:" + ex.Number.ToString();
                str += "\n" + "Message:" + ex.Message;
                str += "\n" + "Class:" + ex.Class.ToString();
                str += "\n" + "Procedure:" + ex.Procedure.ToString();
                str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                str += "\n" + "Server:" + ex.Server.ToString();
                // Display error message
                lblMessage.Text = "Error adding user data." + str;
            }
            finally
            {
                // Close the connection
                conn.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";

            }
        }
    }
}