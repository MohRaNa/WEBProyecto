<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <title>Search</title>
    <link rel="stylesheet" href="../../css/styles.css" />
  </head>
  <body>
    <header>
      <nav>
        <a href="../../index.aspx">Inicio</a>
        <form  id="form" action="./Search.aspx" method="post"> 
          <input type="text" id="search-input" name="search-input" placeholder="Buscar" />
          <input class="submit" type="submit" value="Submit" />
        </form>
        <a href="./SignUp.html">Sign Up</a>
        <a href="./LogIn.html">Log In</a>
        <a href="./Cart.aspx">
          <img src="../../assets/carrito.png" width="30px" height="30px" />
        </a>
      </nav>
      <br />
      <nav>
        <a href="../Nav-Header2/hombres.aspx">Hombres</a>
        <a href="../Nav-Header2/mujeres.aspx">Mujeres</a>
        <a href="../Nav-Header2/ninos.aspx">Niños</a>
      </nav>
    </header>
    <main>
      <div class="card-container">
        <%  
          //Archivo: Search.aspx
          string searchName = Request.Form["search-input"];

          string ID, Name, Description, Cost, Color, Stock, Size;

          string sql = @"SELECT idProduct, name, description, size, cost, color, stock FROM [dbo].[Product] WHERE name like '%" + searchName + "%'";

          using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
          {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
              ID= dr["idProduct"].ToString();
              Name = dr["name"].ToString();
              Description = dr["description"].ToString();
              Size = dr["size"].ToString();
              Cost = dr["cost"].ToString();
              Color = dr["color"].ToString();
              Stock = dr["stock"].ToString();

              %>
              <div class="card" style="padding-bottom: 10%;" onclick="redirectToProductPage('<%= ID %>')">
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
    <footer style="position: relative;"
        <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>
    <script src="script.js"></script>
    <script>
      function redirectToProductPage(id) {
        window.location.href = './Product.aspx?id=' + id;
      }
    </script>
  </body>
</html>