using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


public partial class Fees : System.Web.UI.Page
{    
    protected string strResponsibleDepartment;
    protected string feeCount;
    protected string apiUrl;
    protected string embedUrl;
    protected string amountColumn;
    protected string nameColumn;
    protected string descriptionColumn;
    protected string deptColumn;
    protected string statAuthColumn;
    protected string tagColumn;
    protected string idColumn;

    protected void Page_Load(object sender, EventArgs e)
    {

        string baseUrl = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath;
        if (HttpContext.Current.Request.ApplicationPath.Length > 1)
        {
            baseUrl = baseUrl + "/";
        }
        string relativeUrl = "api";
        apiUrl = baseUrl + relativeUrl;
        embedUrl = baseUrl;
        string connectionString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand command;
        SqlDataReader rdr;
        string tableName = getAppSettingsValue("tableName");

        try
        {
            if (Application["ResponsibleDepartment"] == null)
            {                
                //string searchColumn = getAppSettingsValue("searchColumn");
                deptColumn = getAppSettingsValue("deptColumn");
                List<string> ResponsibleDepartment = new List<string>();

                command = new SqlCommand("SELECT DISTINCT [" + deptColumn + "] FROM [" + tableName + "] ORDER BY [" + deptColumn + "]", conn);
                command.CommandTimeout = 3600;

                // ... SQL connection and command set up
                conn.Open();

                rdr = command.ExecuteReader();

                while (rdr.Read())
                {
                    int pos = ResponsibleDepartment.IndexOf(rdr[deptColumn].ToString());
                    if (pos == -1)
                    {
                        string strRespDept = rdr[deptColumn].ToString();
                        //if (strRespDept.Contains(@"'"))
                        //{
                        //    strRespDept.Replace(@"'", @"''");
                        //}                        
                        ResponsibleDepartment.Add(strRespDept);
                    }
                }
                rdr.Close();

                ResponsibleDepartment.Sort();
                Application["ResponsibleDepartment"] = string.Join("\",\"", ResponsibleDepartment.ToArray<String>());                
            }
            strResponsibleDepartment = Application["ResponsibleDepartment"].ToString();

            if (Application["feeCount"] == null)
            {
                command = new SqlCommand("SELECT COUNT(*) AS feeCount FROM [" + tableName + "]", conn);
                rdr = command.ExecuteReader();
                while (rdr.Read())
                {
                    Application["feeCount"] = rdr["feeCount"].ToString();
                }
                rdr.Close();
            }
            feeCount = Application["feeCount"].ToString();
            
            amountColumn = getAppSettingsValue("amountColumn");
            nameColumn = getAppSettingsValue("nameColumn");
            descriptionColumn = getAppSettingsValue("descriptionColumn");
            //deptColumn = getAppSettingsValue("deptColumn");
            statAuthColumn = getAppSettingsValue("statAuthColumn");
            tagColumn = getAppSettingsValue("tagColumn");
            idColumn = getAppSettingsValue("idColumn");

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