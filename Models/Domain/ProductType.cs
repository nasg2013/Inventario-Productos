namespace InventarioProductosPruebaPerfil.Models.Domain
{
    public class ProductType
    {
        private int productTypeId;
        private string name;

        public ProductType(int productTypeId, string name)
        {
            this.productTypeId = productTypeId;
            this.name = name;
        }

        public ProductType()
        {
        }

        public int ProductTypeId { get => productTypeId; set => productTypeId = value; }
        public string Name { get => name; set => name = value; }
    }
}
