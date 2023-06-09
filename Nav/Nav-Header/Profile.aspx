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
        <form id="form" action="./Search.aspx" method="post">
          <input
            type="text"
            id="search-input"
            name="search-input"
            placeholder="Buscar"
          />
          <input class="submit" type="submit" value="Submit" />
        </form>
        <a href="./LogOut.aspx">Log Out</a>
        Bienvenid@, <%Response.Write(Session("username"))%>
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

    <main></main>
    <footer>
      <ul>
        <p>Todos los derechos reservados. &copy; 2023</p>
      </ul>
    </footer>
    <script src="script.js"></script>
  </body>
</html>
