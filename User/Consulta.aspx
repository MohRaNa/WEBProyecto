<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <title>Ropa - Mujeres</title>
    <link rel="stylesheet" href="../css/styles.css" />
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
        <%		//Archivo: Datos.aspx
		string Nombre, Matricula, Calificacion;

		string sql =@"SELECT idUser, name, lastName, email, country, state, city, zip, street, password, contact FROM [dbo].[User] " ;	
												 
		using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
              
			  {
                  conn.Open();
				  
                  SqlCommand cmd = new SqlCommand(sql,conn); //ejecutamos la instruccion

				SqlDataReader dr = cmd.ExecuteReader();
				
				Response.Write("<table border='1' style='border-collapse:collapse'><tr><td>Nombre</td><td>Matr&iacutecula</td><td>Calificacion</td></tr>");
				
				while(dr.Read())
				{
					
					Nombre = dr[0].ToString();
					Matricula = dr[1].ToString();
					Calificacion = dr[2].ToString();
					
					Response.Write("<tr><td>"+Nombre+"</td><td>"+Matricula+"</td><td>"+Calificacion+"</td></tr>");
					
					
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
   