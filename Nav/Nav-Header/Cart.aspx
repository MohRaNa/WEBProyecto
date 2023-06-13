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

<% // Archivo: Carrito.aspx
    string Producto, Precio, Cantidad;

    string sql = @"SELECT * FROM Product";

    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
    {
        conn.Open();

        SqlCommand cmd = new SqlCommand(sql, conn);

        SqlDataReader dr = cmd.ExecuteReader();
        Response.Write("<table border='1' style='border-collapse:collapse:' style='font-weight: bold'><tr><td>Producto</td><td>Precio</td><td>Cantidad</td><td>Total</td></tr>");
        while (dr.Read())
        {
            Producto = dr[1].ToString();
            Precio = dr[4].ToString();
            Cantidad = dr[6].ToString();

            float precioFloat = float.Parse(Precio);
            int cantidadInt = int.Parse(Cantidad);
            float total = precioFloat * cantidadInt;

            Response.Write("<tr><td>" + Producto + "</td><td>" + Precio + "</td><td><input type='number' id='cantidad_" + Producto + "' name='cantidad_" + Producto + "' min='0' max='" + Cantidad + "' value='" + Cantidad + "' onchange='calcularTotal(\"" + Producto + "\", " + precioFloat + ")'/></td><td id='total_" + Producto + "'>" + total + "</td></tr>");
        }

        conn.Close();

        Response.Write("</table>");
    }
    
    Response.Write("<div id='sumaTotal'></div>");
    Response.Write("</body></html>");

    // Agregar el botón que invoca la función guardarCambios()
    Response.Write("<button onclick='guardarCambios()'>Guardar cambios</button>");

    // Agregar el script de JavaScript para validar la cantidad, calcular el total y mostrar la suma total
    Response.Write("<script>");
    Response.Write("function guardarCambios() {");
    Response.Write("    var filas = document.getElementsByTagName('tr');");
    Response.Write("    for (var i = 0; i < filas.length; i++) {");
    Response.Write("        var cantidadInput = document.getElementById('cantidad_' + i);");
    Response.Write("        var nuevaCantidad = parseInt(cantidadInput.value);");
    Response.Write("        if (isNaN(nuevaCantidad) || nuevaCantidad < 0 || nuevaCantidad > cantidadInput.max) {");
    Response.Write("            alert('Ingrese un número válido para la cantidad.');");
    Response.Write("            return;");
    Response.Write("        }");
    Response.Write("        var precio = parseFloat(cantidadInput.getAttribute('data-precio'));");
    Response.Write("        calcularTotal(i, precio);");
    Response.Write("    }");
    Response.Write("    mostrarSumaTotal();");
    Response.Write("    alert('Cambios guardados.');");
    Response.Write("}");

    Response.Write("function calcularTotal(i, precio) {");
    Response.Write("    var cantidadInput = document.getElementById('cantidad_' + i);");
    Response.Write("    var totalElement = document.getElementById('total_' + i);");
    Response.Write("    var nuevaCantidad = parseInt(cantidadInput.value);");
    Response.Write("    var total = precio * nuevaCantidad;");
    Response.Write("    totalElement.textContent = total.toFixed(2);");
    Response.Write("}");

    Response.Write("function mostrarSumaTotal() {");
    Response.Write("    var totales = document.querySelectorAll('[id^=\"total_\"]');");
    Response.Write("    var sumaTotal = 0;");
    Response.Write("    for (var i = 0; i < totales.length; i++) {");
    Response.Write("        var total = parseFloat(totales[i].textContent);");
    Response.Write("        sumaTotal += total;");
    Response.Write("    }");
    Response.Write("    document.getElementById('sumaTotal').textContent = 'Suma total: ' + sumaTotal.toFixed(2);");
    Response.Write("}");
    Response.Write("</script>");
%>


<div id="cart-total"></div>

    <a href="#" id="checkout-button" class="checkout-button">Realizar pago</a>
<footer>
      <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>

    <script src="script.js"></script>
  </body>
</html>


