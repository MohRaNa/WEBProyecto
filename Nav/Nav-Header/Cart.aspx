<%@ Page Language = "C#" %>
<%@ import namespace="System.Data.SqlClient" %>
<%@ import namespace="System.Configuration" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="../../css/styles.css" />
    <style>
      body {
        font-family: Arial, sans-serif;
      }

      h1 {
        text-align: center;
      }
  	table {
        width: 100%;
        border-collapse: collapse;
      }

      th,
      td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }


      .total {
        font-weight: bold;
      }

      .checkout-button {
        display: block;
        width: 100%;
        padding: 12px;
        text-align: center;
        background-color: #4caf50;
        color: white;
        text-decoration: none;
        font-size: 16px;
        margin-top: 20px;
      }

      .checkout-button:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  <body>
    <header>
      <nav>
        <a href="../../index.html">Inicio</a>
        <form id="form" action="./Search.aspx" method="post">
          <input
            type="text"
            id="search-input"
            name="search-input"
            placeholder="Buscar"
          />
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
        <a href="../Nav-Header2/ninos.html">Ninos</a>
      </nav>
    </header>

<%   //Archivo: Carrito.aspx
    string Producto, Precio, Cantidad;

    string sql =@"SELECT * FROM Product";

    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))

    {
        conn.Open();

        SqlCommand cmd = new SqlCommand(sql,conn);

        SqlDataReader dr = cmd.ExecuteReader();
 Response.Write("<table border='1' style='border-collapse:collapse:' style='font-weight: bold'><tr><td>Producto</td><td>Precio</td><td>Cantidad</td></tr>");
	    while(dr.Read())
            {
                Producto = dr[1].ToString();
                Precio = dr[4].ToString();
                Cantidad = dr[6].ToString();

                Response.Write("<tr><td>"+Producto+"</td><td>"+Precio+"</td><td>"+Cantidad+"</td></tr>");
            }

        conn.Close();

        Response.Write("</table>");
    }
    
    Response.Write("</body></html>");
%>

<div id="cart-total"></div>

    <a href="#" id="checkout-button" class="checkout-button">Realizar pago</a>
<footer>
      <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>

    <script src="script.js"></script>
  </body>
</html>


