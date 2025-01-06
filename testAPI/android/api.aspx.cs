using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using lib_db;
using Newtonsoft.Json;
using System.Configuration;

namespace testAPI.android
{
    public partial class api : System.Web.UI.Page
    {
        sqlserver get_db()
        {
            sqlserver db = new sqlserver();
            db.cnstr =  ConfigurationManager.ConnectionStrings["cnstr_57kmt"].ConnectionString;
            return db;
        }
        class phan_hoi
        {
            public int ok;
            public string msg;
        }
        void do_action(string action)
        {
            try
            {
                string json = "";
                sqlserver db = get_db();
                switch (action)
                {
                    case "add_new":
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.Parameters.Add("@title", SqlDbType.NVarChar, 255).Value = Request["title"];
                            cmd.Parameters.Add("@body", SqlDbType.NText).Value = Request["body"];
                            json = db.get_json(action, cmd);
                        }
                        break;
                    case "get_id":
                    case "new_id":
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.Parameters.Add("@id", SqlDbType.Int).Value = Request["id"];
                            json = db.get_json(action, cmd);
                        }
                        break;
                    case "list_all":
                    case "last_id":
                        json = db.get_json(action);
                        break;

                }
                Response.Write(json);
            }
            catch (Exception ex)
            {
                phan_hoi p = new phan_hoi();
                p.ok = 0;
                p.msg = ex.Message;
                Response.Write(JsonConvert.SerializeObject(p));
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            switch (action)
            {
                case "add_new":
                case "list_all":
                case "last_id":
                case "get_id":
                case "next_id":
                    do_action(action);
                    break;
                default:
                    phan_hoi p = new phan_hoi();
                    p.ok = 0;
                    p.msg = $"Không tồn tại action={action}";
                    Response.Write(JsonConvert.SerializeObject(p));
                    break;
            }
        }
    }
}