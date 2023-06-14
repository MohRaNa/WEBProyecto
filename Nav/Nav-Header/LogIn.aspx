<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

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
            // Obtener los valores del formulario
            string name = Request.Form["uname"];
            string password = Request.Form["psw"];

            string sql = "SELECT COUNT(*) FROM [dbo].[User] WHERE name = @name AND password = @password";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@password", password);
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    Response.Redirect("../../index.aspx");
                }
                else
                {
                    Response.Redirect("./LogIn.aspx");
                }

                conn.Close();
            }
        %>
    </main>
    <script src="script.js"></script>
</body>
</html>
