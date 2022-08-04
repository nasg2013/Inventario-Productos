namespace InventarioProductosPruebaPerfil.Models.Domain
{
    public class Product
    {

        private int productId;
        private string name;
        private int quantity;
        private float price;
        private int typeId;
        private int priceTypeId;

        public Product(int productId, string name, int quantity, float price, int typeId, int priceTypeId)
        {
            this.productId = productId;
            this.name = name;
            this.quantity = quantity;
            this.price = price;
            this.typeId = typeId;
        }

        public Product()
        {
        }

        public int ProductId { get => productId; set => productId = value; }
        public string Name { get => name; set => name = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public float Price { get => price; set => price = value; }
        public int TypeId { get => typeId; set => typeId = value; }
        public int PriceTypeId { get => priceTypeId; set => priceTypeId = value; }
    }
}
