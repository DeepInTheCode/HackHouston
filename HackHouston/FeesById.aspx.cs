using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


public partial class FeesById : System.Web.UI.Page
{    
    //protected string strResponsibleDepartment;
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
        string tableName = getAppSettingsValue("tableName");
        string searchColumn = getAppSettingsValue("searchColumn");
        string authority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
        string relativeUrl = "/api";
        apiUrl = authority + relativeUrl;
        
        //List<string> ResponsibleDepartment = new List<string>();
        
        string connectionString = ConfigurationManager.ConnectionStrings["HackHou2008ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        try
        {
            //SqlCommand command = new SqlCommand("SELECT DISTINCT [" + searchColumn + "] FROM [" + tableName + "] ORDER BY [" + searchColumn + "]", conn);
            //command.CommandTimeout = 3600;

            //// ... SQL connection and command set up
            //conn.Open();

            //SqlDataReader rdr = command.ExecuteReader();

            //while (rdr.Read())
            //{
            //    int pos = ResponsibleDepartment.IndexOf(rdr[searchColumn].ToString());
            //    if (pos == -1)
            //    {
            //        ResponsibleDepartment.Add(rdr[searchColumn].ToString());
            //    }
            //}
            //rdr.Close();
            //ResponsibleDepartment.Sort();
            //strResponsibleDepartment = string.Join("','", ResponsibleDepartment.ToArray<String>());

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
        catch (SqlException sqlException)
        { // exception         
            throw sqlException;
        }
        finally
        {
            conn.Close(); // close the connection         
        }       
    }

    private string getAppSettingsValue(string keyName)
    {
        return WebConfigurationManager.AppSettings[keyName];
    }
}