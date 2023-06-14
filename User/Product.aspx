<%@ Page Language="C#"  %>
<%@ import namespace = "System" %>
<%@ import namespace = "System.Data.SqlClient" %>
<%@ import namespace = "System.Configuration" %>
<%@ import namespace = "System.IO" %>


<%
    // Archivo: Save.aspx
    string name = Request.Form["name"];
    string description = Request.Form["description"];
    string size = Request.Form["size"];
    string cost = Request.Form["cost"];
    string color = Request.Form["color"];
    string stock_form = Request.Form["stock"];
    int stock = int.Parse(stock_form);
    string category = Request.Form["category"];

    int idCategory = -1; // Valor inicial para el idCategory

    // Asignar el idCategory basado en la opción seleccionada
    if (category == "Hombre")
    {
        idCategory = 1;
    }
    else if (category == "Mujer")
    {
        idCategory = 2;
    }
    else if (category == "Niño")
    {
        idCategory = 3;
    }

    if (idCategory != -1)
    {
        string imageName = "";
        if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
        {
            // Guardar la imagen enviada en el directorio "assets"
            HttpPostedFile file = Request.Files[0];
            string fileName = Path.GetFileName(file.FileName);
            string extension = Path.GetExtension(fileName);
            imageName = Guid.NewGuid().ToString() + extension; // Generar un nombre único para la imagen
            string filePath = Server.MapPath("~/assets/" + imageName);

            try
            {
                file.SaveAs(filePath);
            }
            catch (Exception ex)
            {
                Response.Write("Error al guardar la imagen: " + ex.Message);
            }
        }

        string sql = "INSERT into [dbo].[Product] (name, description, size, cost, color, stock, idCategory, image) VALUES (@name, @description, @size, @cost, @color, @stock, @idCategory, @image);";
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@size", size);
            cmd.Parameters.AddWithValue("@cost", cost);
            cmd.Parameters.AddWithValue("@color", color);
            cmd.Parameters.AddWithValue("@stock", stock);
            cmd.Parameters.AddWithValue("@idCategory", idCategory);
            cmd.Parameters.AddWithValue("@image", imageName);

            try
            {
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("Datos guardados correctamente<br>");

                // Mostrar la imagen
                if (!string.IsNullOrEmpty(imageName))
                {
                    string imagePath = "../assets/" + imageName;
                    Response.Write("<img src=\"" + imagePath + "\" alt=\"Imagen del producto\"><br>");
                }
            }
            catch (Exception e)
            {
                Response.Write("Excepcion: " + e);
                conn.Close();
                Response.Write("Error al guardar los datos<br>");
            }
        }
    }
    else
    {
        Response.Write("Categoría no válida<br>");
    }
%>

<html></html>
