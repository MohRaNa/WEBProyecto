using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace ShoppingCart
{
    public partial class CartItems : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=localhost;Initial Catalog=dbWeb;User ID=ProgramacionWeb;Password=123456";

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

        // Método para obtener todos los productos
        public static List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM [dbo].[Product]";
                SqlCommand command = new SqlCommand(query, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Product product = new Product();
                        product.Id = (int)reader["idProduct"];
                        product.Name = (string)reader["name"];
                        product.Cost = (decimal)reader["cost"];

                        products.Add(product);
                    }
                }
            }

            return products;
        }

        // Método para convertir una lista de productos a formato JSON
        public static string ConvertToJson(List<Product> products)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(products);
        }
    }
}


