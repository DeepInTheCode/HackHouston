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
    protected string apiUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        string tableName = WebConfigurationManager.AppSettings["tableName"];
        string searchColumn = WebConfigurationManager.AppSettings["searchColumn"];
        string authority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
        string relativeUrl = "/api";
        apiUrl = authority + relativeUrl;
        
        List<string> ResponsibleDepartment = new List<string>();
        
        string connectionString = ConfigurationManager.ConnectionStrings["HackHou2008ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        try
        {
            SqlCommand command = new SqlCommand("SELECT DISTINCT " + searchColumn + " FROM " + tableName + " ORDER BY " + searchColumn, conn);
            command.CommandTimeout = 3600;
                        
            // ... SQL connection and command set up
            conn.Open();

            SqlDataReader rdr = command.ExecuteReader();

            while (rdr.Read())
            {
                int pos = ResponsibleDepartment.IndexOf(rdr[searchColumn].ToString());
                if (pos == -1)
                {
                    ResponsibleDepartment.Add(rdr[searchColumn].ToString());
                }
            }      
            rdr.Close();
            ResponsibleDepartment.Sort();
            strResponsibleDepartment = string.Join("','", ResponsibleDepartment.ToArray<String>());
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
}