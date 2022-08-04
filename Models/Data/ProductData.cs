using InventarioProductosPruebaPerfil.Models.Domain;
using System.Data.SqlClient;

namespace InventarioProductosPruebaPerfil.Models.Data
{
    public class ProductData
    {

        private readonly IConfiguration _configuration;
        string connectionString;

        public ProductData(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionString = _configuration.GetConnectionString("DefaultConnection");
        }
        public ProductData() { }

        public List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("sp_SelectProduct", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader sqlDataReader = command.ExecuteReader();

                while (sqlDataReader.Read())
                {

                    products.Add(new Product
                    {
                        ProductId = Convert.ToInt32(sqlDataReader["id_Product"]),
                        Name = sqlDataReader["Name"].ToString(),
                        Quantity = Convert.ToInt32(sqlDataReader["Quantity"]),
                        Price = Convert.ToInt32(sqlDataReader["Price"]),
                        PriceTypeId = Convert.ToInt32(sqlDataReader["id_Price_Type"]),
                        TypeId = Convert.ToInt32(sqlDataReader["id_Type"])

                    });
                }
                connection.Close();
            }
            return products;
        }

        public List<ProductType> GetProductType()
        {
            List<ProductType> productTypeList = new List<ProductType>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("sp_SelectProductType", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader sqlDataReader = command.ExecuteReader();

                while (sqlDataReader.Read())
                {

                    productTypeList.Add(new ProductType
                    {
                        ProductTypeId = Convert.ToInt32(sqlDataReader["Id_Product_Type"]),
                        Name = sqlDataReader["Name"].ToString()

                    });
                }
                connection.Close();
            }
            return productTypeList;
        }

        public List<PriceType> GetPriceType()
        {
            List<PriceType> priceTypeList = new List<PriceType>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("sp_SelectPriceType", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader sqlDataReader = command.ExecuteReader();

                while (sqlDataReader.Read())
                {

                    priceTypeList.Add(new PriceType
                    {
                        PriceTypeId = Convert.ToInt32(sqlDataReader["Id_Price_Type"]),
                        Name = sqlDataReader["Name"].ToString()

                    });
                }
                connection.Close();
            }
            return priceTypeList;
        }

        public int AddProducts(Product product)
        {

            int resultToReturn;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("sp_InsertProduct", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Name", product.Name);
                command.Parameters.AddWithValue("@Quantity", product.Quantity);
                command.Parameters.AddWithValue("@Price", product.Price);
                command.Parameters.AddWithValue("@Id_Type", product.TypeId);
                command.Parameters.AddWithValue("@Id_Price", product.PriceTypeId);
                resultToReturn = command.ExecuteNonQuery();
                connection.Close();
            }
            return resultToReturn;

        }

    }
}
