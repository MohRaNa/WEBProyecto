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
        <form  id="form" action="./Search.aspx" method="post"> 
          <input type="text" id="search-input" name="search-input" placeholder="Buscar" />
          <input class="submit" type="submit" value="Submit" />
        </form>
        <a href="./SignUp.html">Sign Up</a>
        <a href="./LogIn.html">Log In</a>
        <a href="./Cart.html">
          <img src="../../assets/carrito.png" width="30px" height="30px" />
        </a>
      </nav>
      <br />
      <nav>
        <a href="../Nav-Header2/hombres.html">Hombres</a>
        <a href="../Nav-Header2/mujeres.html">Mujeres</a>
        <a href="../Nav-Header2/ninos.html">Niños</a>
      </nav>
    </header>
    <main>
      <div class="sidebar">
        <h3>Categorías</h3>
        <form id="category-form" action="./Search.aspx" method="post">
          <input type="checkbox" id="category1" name="category" value="Mujer" />
          <label for="category1">Mujer</label>
          <br />
          <input type="checkbox" id="category2" name="category" value="Hombre" />
          <label for="category2">Hombre</label>
          <br />
          <input type="checkbox" id="category3" name="category" value="Niño" />
          <label for="category3">Niño</label>
          <br />
          <input class="submit" type="submit" value="Filtrar" />
        </form>
      </div>
      <div class="card-container">
        <%  
          //Archivo: Search.aspx
          string searchName = Request.Form["search-input"];

          string Name, Description, Cost, Color, Stock, Size;

          string sql = @"SELECT name, description, size, cost, color, stock FROM [dbo].[Product] WHERE name like '%" + searchName + "%'";

          using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
          {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
              Name = dr[0].ToString();
              Description = dr[1].ToString();
              Size = dr[2].ToString();
              Cost = dr[3].ToString();
              Color = dr[4].ToString();
              Stock = dr[5].ToString();

              %>
              <div class="card">
                <h3><%= Name %></h3>
                <p><%= Description %></p>
                <p>Size: <%= Size %></p>
                <p>Cost: <%= Cost %></p>
                <p>Color: <%= Color %></p>
                <p>Stock: <%= Stock %></p>
              </div>
              <%
            }
            
            conn.Close();
          }
        %>
      </div>
    </main>
    <footer>
      <ul>
        <p>Todos los derechos reservados. &copy; 2023</p>
      </ul>
    </footer>
    <script src="script.js"></script>
  </body>
</html>