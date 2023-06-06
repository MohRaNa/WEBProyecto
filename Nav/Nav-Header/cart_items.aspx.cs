using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Configuration; // Add this namespace for ConfigurationManager

namespace ShoppingCart
{
    public partial class cartItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Obtener todos los productos
                List<Product> products = GetProducts();

                // Convertir los productos a formato JSON
                string json = ConvertToJson(products);

                // Asignar el resultado a un control en la página (por ejemplo, un Literal)
                Literal1.Text = json;
            }
        }

        // Clase para representar un producto
        public class Product
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public decimal Cost { get; set; }
        }

        string query = "SELECT id, name, cost FROM [dbo].[Product]";

        public List<Product> GetProducts() // Remove the 'static' modifier from the method signature
        {
            List<Product> products = new List<Product>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ToString()))
            {
                conn.Open(); 

                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader dr = command.ExecuteReader(); // Fix the variable name from 'cmd' to 'command'

                while (dr.Read())
                {
                    Product product = new Product();
                    product.Id = Convert.ToInt32(dr["id"]); // Use proper data type conversion
                    product.Name = dr["name"].ToString();
                    product.Cost = Convert.ToDecimal(dr["cost"]); // Use proper data type conversion

                    products.Add(product);
                }
            }

            return products;
        }

        // Método para convertir una lista de productos a formato JSON
        public string ConvertToJson(List<Product> products) 
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(products);
        }
    }
}