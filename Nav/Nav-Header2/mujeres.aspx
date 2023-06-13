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
        <a href="../../index.aspx">Inicio</a>
        <form id="form" action="../Nav-Header/Search.aspx" method="post">
          <input
            type="text"
            id="search-input"
            name="search-input"
            placeholder="Buscar"
          />
          <input class="submit" type="submit" value="Submit" />
        </form>
        <a href="../Nav-Header/SignUp.html">Sign Up</a>
        <a href="../Nav-Header/LogIn.aspx">Log In</a>
        <a href="../Nav-Header/Cart.aspx">
          <img src="../../assets/carrito.png" width="30px" height="30px" />
        </a>
      </nav>
      <br />
      <nav>
        <a href="./hombres.aspx">Hombres</a>
        <a href="./mujeres.aspx">Mujeres</a>
        <a href="./ninos.aspx">Niños</a>
      </nav>
    </header>

    <main>
      <h1>Ropa para Mujeres</h1>
      <section class="destacados">
        <h2>Destacados</h2>
        <ul>
          
            <% 
        string sql = "SELECT p.[name],p.[description],p.size,p.cost,p.color,p.stock FROM [dbWeb].[dbo].[Product] AS p INNER JOIN [dbWeb].[dbo].[Categories] AS c ON c.idCategories = p.idCategory WHERE [idCategory] = 2 ";

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                string name = dr["name"].ToString();
                string description = dr["description"].ToString();
                string size = dr["size"].ToString();
                string cost = dr["cost"].ToString();
                string color = dr["color"].ToString();
                string stock = dr["stock"].ToString();

                Response.Write("<li><a href='../ProductView.html'><img src='https://via.placeholder.com/300x300' alt='Producto 1'/></a><h3>" + name + "</h3><p>" + description + "</p><p>Talla : " + size + "</p><p>Precio : " + cost + "</p></li>");
            }

            conn.Close();
        }
        %>
        
        </ul>
      </section>
      
    </main>

    <footer>
      <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>

    <script src="script.js"></script>
  </body>
</html>
