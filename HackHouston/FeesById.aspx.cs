using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


public partial class FeesById : System.Web.UI.Page
{    
    protected string idArray;
    protected string apiUrl;
    protected string amountColumn;
    protected string nameColumn;
    protected string descriptionColumn;
    protected string deptColumn;
    protected string statAuthColumn;
    protected string tagColumn;
    protected string idColumn;

    protected void Page_Load(object sender, EventArgs e)
    {
        string authority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
        string relativeUrl = "/api";
        apiUrl = authority + relativeUrl;
            
        try
        {
            amountColumn = getAppSettingsValue("amountColumn");
            nameColumn = getAppSettingsValue("nameColumn");
            descriptionColumn = getAppSettingsValue("descriptionColumn");
            deptColumn = getAppSettingsValue("deptColumn");
            statAuthColumn = getAppSettingsValue("statAuthColumn");
            tagColumn = getAppSettingsValue("tagColumn");
            idColumn = getAppSettingsValue("idColumn");

            if (Request.QueryString["id"] == null)
            {
                idArray = null;
            }
            else
            {
                idArray = Request.QueryString["id"].ToString();
            }

            //End of method
        }
        catch (Exception exception)
        { // exception         
            throw exception;
        }      
    }

    private string getAppSettingsValue(string keyName)
    {
        return WebConfigurationManager.AppSettings[keyName];
    }
}