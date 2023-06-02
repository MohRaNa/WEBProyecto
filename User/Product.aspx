<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>


<%		//Archivo: Save.aspx
        string idProduct_form =  Request.Form["idProduct"];
        int idProduct = Int16.Parse(idProduct);
		string name = Request.Form["name"];
		string description = Request.Form["description"];
		string size = Request.Form["size"];
		string cost = Request.Form["cost"];
        string color = Request.Form["color"];
        string stock_form =  Request.Form["stock"];
		int stock = Int16.Parse(stock);
        string idUser_form =  Request.Form["idUser"];
        int idUser = Int16.Parse(idUser);
		string sql = "";	


				//sql = @"INSERT INTO dbo.Product (idProduct,name,description,size,cost,color,stock,idUser) VALUES (@idProduct, @name, @description, @size, @cost, @color, @stock, @idUser) " ;
				sql = "INSERT into [dbo].[Product] (idProduct,name,description,size,cost,color,stock,idUser) VALUES (idProduct,name,description,size,cost,color,stock,idUser); ";
		using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
              
			  {
                  conn.Open();
				  
                  SqlCommand cmd = new SqlCommand(sql,conn); //ejecutamos la instruccion
                  
                  cmd.Parameters.AddWithValue("@idProduct", idProduct);
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
