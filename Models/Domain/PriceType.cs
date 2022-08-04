namespace InventarioProductosPruebaPerfil.Models.Domain
{
    public class PriceType
    {

        private int priceTypeId;
        private string name;

        public PriceType(int priceTypeId, string name)
        {
            this.PriceTypeId = priceTypeId;
            this.Name = name;
        }

        public PriceType()
        {
        }

        public int PriceTypeId { get => priceTypeId; set => priceTypeId = value; }
        public string Name { get => name; set => name = value; }

    }
}
