using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.Configuration;
using Newtonsoft.Json;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Helpers;


namespace HackHouston.Services
{
    public class JsonRepository
    {
        public HttpResponseMessage GetJsons(string hash, string callback, string id)
        {
            string strHash = "";
            string strCallback = "";
            string strId = "";
            if (!(hash == null))
            {
                strHash = hash;
            }
            if (!(callback == null))
            {
                strCallback = callback;
            }
            if (!(id == null)) 
            {
                strId = id;
            }
            string strApplication = strHash + strCallback + strId;

            //if (HttpContext.Current.Application[strApplication] == null)
            //{
                SqlDataReader rdr = null;
                SqlConnection conn = null;
                SqlCommand command = null;

                string connectionString = string.Empty;
                string json = string.Empty;
                string tableName = WebConfigurationManager.AppSettings["tableName"];
                bool bId = !(id == "all");

                try
                {
                    connectionString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
                    conn = new SqlConnection(connectionString);
                    string nameColumn = WebConfigurationManager.AppSettings["nameColumn"];
                    string strSQL = "SELECT * FROM [" + tableName + "]";
                    if (bId)
                    {
                        string idColumn = WebConfigurationManager.AppSettings["idColumn"];
                        string idList = "";
                        string[] idArray = id.Split(',');
                        foreach (string idNum in idArray)
                        {
                            if (!(idNum == idArray[0]))
                            {
                                idList += ", ";
                            }
                            idList += "'" + idNum + "'";
                        }
                        strSQL = strSQL + " WHERE [" + idColumn + "] IN (" + idList + ")";
                    }
                    strSQL = strSQL + " ORDER BY [" + nameColumn + "]";
                    command = new SqlCommand(strSQL, conn);
                    command.CommandTimeout = 3600;


                    StringBuilder allJSONs = new StringBuilder();
                    // ... SQL connection and command set up
                    conn.Open();

                    rdr = command.ExecuteReader();

                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    using (JsonWriter jsonWriter = new JsonTextWriter(sw))
                    {
                        jsonWriter.Formatting = Formatting.None;
                        jsonWriter.WriteStartArray();
                        while (rdr.Read())
                        {
                            int fieldcount = rdr.FieldCount; // count how many columns are in the row
                            object[] values = new object[fieldcount]; // storage for column values
                            rdr.GetValues(values); // extract the values in each column
                            jsonWriter.WriteStartObject();
                            for (int index = 0; index < fieldcount; index++)
                            { // iterate through all columns
                                jsonWriter.WritePropertyName(rdr.GetName(index)); // column name
                                jsonWriter.WriteValue(values[index]); // value in column
                            }
                            jsonWriter.WriteEndObject();
                        }
                        jsonWriter.WriteEndArray();
                    }
                    rdr.Close();
                    json = sb.ToString();

                    if (!(callback == null))
                    {
                        json = callback + " && " + callback + "(" + json + ");";
                    }
                    if (!(hash == null))
                    {
                        //Do nothing - we are not currently implementing the MD5 hash
                    }
                    //End of method
                }
                catch (SqlException sqlException)
                { // exception         
                    json = "Connection Exception: " + sqlException.ToString() + "\n";
                }
                finally
                {
                    conn.Close(); // close the connection         
                }
                //HttpContext.Current.Application[strApplication] = ReturnPureJson(json);
            //}
            //return (HttpResponseMessage)HttpContext.Current.Application[strApplication];            
                return ReturnPureJson(json);
        }

        public HttpResponseMessage ReturnPureJson(string json)
        {
            HttpResponseMessage response = new HttpResponseMessage();

            response.Content = new StringContent(json);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            return response;
        }
    }
}