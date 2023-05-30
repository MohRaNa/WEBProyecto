<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>


<%		//Archivo: Save.aspx
        
        int idUser = Int16.Parse(Request.Form["idUser"]);
		string name = Request.Form["name"];
		string lastname = Request.Form["lastname"];
		string email = Request.Form["email"];
		string country = Request.Form["country"];
        string state = Request.Form["state"];
        string city = Request.Form["city"];
		int zip = Int16.Parse(Request.Form["zip"]);
        string street = Request.Form["street"];
        string password = Request.Form["password"];
        int contact = Int16.Parse(Request.Form["contact"]);
		string sql = "";	


        sql = "INSERT INTO [dbo].[User] (idUser, name, lastName, email, country, state, city, zip, street, password, contact) VALUES (@idUser, @name, @lastname, @email, @country, @state, @city, @zip, @street, @password, @contact)";		
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))  
			  {
                  conn.Open();
				  
                  SqlCommand cmd = new SqlCommand(sql,conn); //ejecutamos la instruccion
                  
                  cmd.Parameters.AddWithValue("@idUser", idUser);
				  cmd.Parameters.AddWithValue("@name", name);
				  cmd.Parameters.AddWithValue("@lastname",lastname);
				  cmd.Parameters.AddWithValue("@email", email);
                  cmd.Parameters.AddWithValue("@country", country);
                  cmd.Parameters.AddWithValue("@state", state);
                  cmd.Parameters.AddWithValue("@city", city);
                  cmd.Parameters.AddWithValue("@zip", zip);
                  cmd.Parameters.AddWithValue("@street", street);
                  cmd.Parameters.AddWithValue("@password", password);
                  cmd.Parameters.AddWithValue("@contact", contact);

				try
					{
                cmd.ExecuteNonQuery();
                conn.Close();
				Response.Write("Datos guardados correctamente<br>");
					}
				catch(Exception e)
					{
				Response.Write("Excepcion :" + e);
                conn.Close();
				Response.Write("Error al guardar los datos<br>");

					}

               }
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>

</body>
</html>
