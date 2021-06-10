/*--------------------------------------------------------------| 
|Date: 11/18/16													|
|																|
|Programmer: Pablo Lomeli										|
|																|
|Notes: Does not contain code yet.                              |
|																|
|																|
|Update(12/2/16): Nothing new.                                  |
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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    public void cmdSignOut_ServerClick(object sender, System.EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("logon.aspx", true);
    }
    
    
}