<%@ Page Language="C#"  %>
<%@ import namespace="System" %>
<%@ import namespace="System.Data.SqlClient" %>
<%@ import namespace="System.Configuration" %>

<%
string idProduct = Request.Form["idProduct"];

string orderDate = DateTime.Now.ToString("yyyy-MM-dd");
string deliverDate = DateTime.Now.AddDays(7).ToString("yyyy-MM-dd");
decimal totalPrice;

string sqlGetPrice = @"SELECT cost FROM [dbo].[Product] WHERE idProduct = @idProduct";

using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
{
  conn.Open();
  SqlCommand cmdGetPrice = new SqlCommand(sqlGetPrice, conn);
  cmdGetPrice.Parameters.AddWithValue("@idProduct", idProduct);
  SqlDataReader drGetPrice = cmdGetPrice.ExecuteReader();

  if (drGetPrice.Read())
  {
    totalPrice = Convert.ToDecimal(drGetPrice["cost"]);
    drGetPrice.Close();

    // Insertar en la tabla Order
    string sqlInsertOrder = @"INSERT INTO [dbo].[Order] (orderDate, deliverDate, totalPrice, idUser) VALUES (@orderDate, @deliverDate, @totalPrice, 1); SELECT SCOPE_IDENTITY();";

    SqlCommand cmdInsertOrder = new SqlCommand(sqlInsertOrder, conn);
    cmdInsertOrder.Parameters.AddWithValue("@orderDate", orderDate);
    cmdInsertOrder.Parameters.AddWithValue("@deliverDate", deliverDate);
    cmdInsertOrder.Parameters.AddWithValue("@totalPrice", totalPrice);
    int orderId = Convert.ToInt32(cmdInsertOrder.ExecuteScalar());

    // Insertar en la tabla OrderDetails
    string sqlInsertOrderDetails = @"INSERT INTO [dbo].[OrderDetails] (price, quantity, idProduct, idOrder) VALUES (@price, @quantity, @idProduct, @idOrder)";

    SqlCommand cmdInsertOrderDetails = new SqlCommand(sqlInsertOrderDetails, conn);
    cmdInsertOrderDetails.Parameters.AddWithValue("@price", totalPrice);
    cmdInsertOrderDetails.Parameters.AddWithValue("@quantity", 1);
    cmdInsertOrderDetails.Parameters.AddWithValue("@idProduct", idProduct);
    cmdInsertOrderDetails.Parameters.AddWithValue("@idOrder", orderId);

    cmdInsertOrderDetails.ExecuteNonQuery();

    // Redireccionar al carrito de compras o a otra página de confirmación
    Response.Redirect("./Cart.aspx");
  }
  else
  {
    // El producto no existe
    drGetPrice.Close();
    Response.Redirect("./ProductNotFound.aspx");
  }

  conn.Close();
}
%>
