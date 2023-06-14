
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <title>Ropa - Hombres</title>
    <link rel="stylesheet" href="../../css/styles.css" />
    <style>

      body {
        font-family: Arial, Helvetica, sans-serif;
      }
      form {
        border: 3px solid #f1f1f1;
      }

      input[type="text"],
      input[type="password"],
      input[type="email"],
      input[type="number"] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
      }

      .submit {
        background-color: #020202;
        color: rgb(255, 255, 255);
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
      }

      .submit:hover {
        opacity: 0.8;
      }

      .container {
        padding: 16px;
      }

      span.psw {
        float: right;
      }
    </style>
  </head>
  <body>
    <header>
      <nav>
        <a href="../../index.aspx">Inicio</a>
        <form id="search-form">
          <input type="text" id="search-input" placeholder="Buscar" />
          <input
            type="button"
            onclick="location.href='../../index.aspx';"
            value="Search"
          />
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

    <h1>Registro de Producto</h1>

      <form class="form" action="../../user/Product.aspx" method="post" id="form">
        <div class="container"></div>
      <label for="name">Nombre:</label><br />
      <input type="text" id="name" name="name" /><br />
      <label for="description">Descripcion:</label><br />
      <input type="text" id="description" name="description" /><br />
      <label for="size">Tamaño:</label><br />
      <input type="text" id="size" name="size" /><br />
      <label for="cost">Costo:</label><br />
      <input type="text" id="cost" name="cost" /><br />
      <label for="color">color:</label><br />
      <input type="text" id="color" name="color" /><br />
      <label for="stock">Stock:</label><br />
      <input type="number" id="stock" name="stock" /><br />
      <label for="idUser">idUser:</label><br />
      <input type="number" id="idUser" name="idUser" /><br />
      <label for="image">Image:</label><br />
      <input type="file" id="image" name="image" /><br />
      <br />
      <input type="submit" value="Submit" />
    </form>

    <main></main>
    <footer>
      <p>Todos los derechos reservados. &copy; 2023</p>
    </footer>

    <script src="script.js"></script>
  </body>
</html>

<div class="flex-container">
   
  <div class="item1">item 1</div>

</div>
