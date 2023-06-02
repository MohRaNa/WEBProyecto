<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <title>Ropa - Mujeres</title>
    <link rel="stylesheet" href="../../css/styles.css" />
  </head>
  <body>
    <header>
      <nav>
        <a href="../../index.html">Inicio</a>
        <form id="search-form">
          <input type="text" id="search-input" placeholder="Buscar" />
          <input
            type="button"
            onclick="location.href='../Catalog.html';"
            value="Search"
          />
          <input
          type="button"
          onclick="location.href='../../Consulta.aspx';"
          value="Consultar Todos Los Usuarios"
        />
        </form>
        <a href="../Nav-Header/SignUp.html">Sign Up</a>
        <a href="../Nav-Header/LogIn.html">Log In</a>
        <a href="../Nav-Header/Cart.html">
          <img src="../../assets/carrito.png" width="30px" height="30px" />
        </a>
      </nav>
      <br />
      <nav>
        <a href="./hombres.html">Hombres</a>
        <a href="./mujeres.html">Mujeres</a>
        <a href="./ninos.html">Niños</a>
      </nav>
    </header>
    <main>
        <%		//Archivo: Search.aspx
		string searchName = Request.Form["search-input"];
    string Name, Description, Cost, Color, Stock, Size;

		string sql =@"SELECT name, description, size, cost, color, stock FROM [dbo].[Product] WHERE name like  '%" + searchName + "%'" ;	
												 
		using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
              
			  {
        conn.Open();
        SqlCommand cmd = new SqlCommand(sql,conn); //ejecutamos la instruccion
        SqlDataReader dr = cmd.ExecuteReader();
				
        Response.Write("<table border='1' style='border-collapse:collapse'><tr><td>Name</td><td>Description</td><td>Size</td><td>Cost</td><td>State</td><td>Color</td><td>Stock</td></tr>");
				
				while(dr.Read())
				{
          
					Name = dr[0].ToString();
					Description= dr[1].ToString();
					Size = dr[2].ToString();
					Cost = dr[3].ToString();
          Color = dr[4].ToString();
          Stock = dr[5].ToString();

					Response.Write("<tr><td>"+Name+"</td><td>"+Description+"</td><td>"+Size+"</td><td>"+Cost+"</td><td>"+Color+"</td><td>"+Stock+"</tr>");	
					
				}
				
				conn.Close();
				
				Response.Write("</table>");

        }
    %>
    </main>
    <footer>
        <ul>
          <p>Todos los derechos reservados. &copy; 2023</p>
        </ul>
      </footer>
      <script src="script.js"></script>
    </body>
  </html>
   