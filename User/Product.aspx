<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>
<%@ import namespace = "System.Numerics" %>
<%@ import namespace = "System.Globalization" %>


<%		//Archivo: Save.aspx
		string name = Request.Form["name"];
		string description = Request.Form["description"];
		string size = Request.Form["size"];
		string cost = Request.Form["cost"];
        string color = Request.Form["color"];
        string stock_form =  Request.Form["stock"];
		int stock = int.Parse(stock_form);
        string idUser_form =  Request.Form["idUser"];
        int idUser = int.Parse(idUser_form);
		string sql = "";	


				//sql = @"INSERT INTO dbo.Product (idProduct,name,description,size,cost,color,stock,idUser) VALUES (@idProduct, @name, @description, @size, @cost, @color, @stock, @idUser) " ;
				sql = "INSERT into [dbo].[Product] (name,description,size,cost,color,stock,idUser) VALUES (@name,@description,@size,@cost,@color,@stock,@idUser); ";
		using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
              
			  {
                  conn.Open();
				  
                  SqlCommand cmd = new SqlCommand(sql,conn); //ejecutamos la instruccion
                  
				  cmd.Parameters.AddWithValue("@name", name);
				  cmd.Parameters.AddWithValue("@description",description);
				  cmd.Parameters.AddWithValue("@size", size);
                  cmd.Parameters.AddWithValue("@cost", cost);
                  cmd.Parameters.AddWithValue("@color", color);
                  cmd.Parameters.AddWithValue("@stock", stock);
                  cmd.Parameters.AddWithValue("@idUser", idUser);


				try
					{
                cmd.ExecuteNonQuery();
                conn.Close();
				Response.Write("Datos guardados correctamente<br>");
					}
				catch(Exception e)
					{
				Response.Write("Excepci�n :" + e);
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
