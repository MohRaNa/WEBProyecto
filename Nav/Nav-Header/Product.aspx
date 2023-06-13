<%@ Page Language="C#"  %>
<%@ import namespace="System" %>
<%@ import namespace="System.Data.SqlClient" %>
<%@ import namespace="System.Configuration" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <title>Detalles del producto</title>
    <link rel="stylesheet" href="../../css/styles.css" />
  </head>
  <body>
    <header>
            <nav>
              <a href="../../index.aspx">Inicio</a>
              <form id="form" action="./Search.aspx" method="post">
                <input
                  type="text"
                  id="search-input"
                  name="search-input"
                  placeholder="Buscar"
                />
                <input class="submit" type="submit" value="Submit" />
              </form>
              <a href="./SignUp.aspx">Sign Up</a>
              <a href="./LogIn.aspx">Log In</a>
              <a href="./Cart.aspx">
                <img src="../../assets/carrito.png" width="30px" height="30px" />
              </a>
            </nav>
            <br />
            <nav>
              <a href="../Nav-Header2/hombres.aspx">Hombres</a>
              <a href="../Nav-Header2/mujeres.aspx">Mujeres</a>
              <a href="../Nav-Header2/ninos.aspx">Ninos</a>
            </nav>
        </header>
    <main>
        <div class="product-details">
            <%  
            // Obtener el idProduct de la consulta
            string idProduct = Request.QueryString["id"];

            string Name, Description, Cost, Color, Stock, Size;

            string sql = @"SELECT name, description, size, cost, color, stock FROM [dbo].[Product] WHERE idProduct = @idProduct";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@idProduct", idProduct);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Name = dr["name"].ToString();
                    Description = dr["description"].ToString();
                    Size = dr["size"].ToString();
                    Cost = dr["cost"].ToString();
                    Color = dr["color"].ToString();
                    Stock = dr["stock"].ToString();

                    %>
                    <h2><%= Name %></h2>
                    <p><%= Description %></p>
                    <p>Size: <%= Size %></p>
                    <p>Cost: <%= Cost %></p>
                    <p>Color: <%= Color %></p>
                    <p>Stock: <%= Stock %></p>
                    <%
                }
                else
                {
                    // El producto no existe
                    %>
                    <h2>Producto no encontrado</h2>
                    <p>El producto que estás buscando no existe.</p>
                    <%
                }

                dr.Close();
                conn.Close();
            }
            %>
        </div>
    </main>
    <footer>
        <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>
    <script src="script.js"></script>
  </body>
</html>