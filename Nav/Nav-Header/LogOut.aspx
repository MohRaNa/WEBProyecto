<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Collections" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link rel="stylesheet" href="../../css/styles.css" />
    <style>
      /* Estilos del formulario de inicio de sesión */
    </style>
</head>
<body>
    <main style="border: 3px solid #ccc;">
        <!-- Encabezado y contenido del formulario -->
        <%  
             
             Response.Redirect("LogIn.html");
        %>
    </main>
    <script src="script.js"></script>
</body>
</html>
