using InventarioProductosPruebaPerfil.Models.Data;
using InventarioProductosPruebaPerfil.Models.Domain;
using Microsoft.AspNetCore.Mvc;

namespace InventarioProductosPruebaPerfil.Controllers
{
    public class ProductController : Controller
    {

        private readonly ILogger<ProductController> _logger;
        private readonly IConfiguration _configuration;

        ProductData productData;

        public ProductController(ILogger<ProductController> logger,
                               IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;

        }

        public IActionResult GetProductType()
        {

            //llamada al modelo para obtener los estudiantes
            productData = new ProductData(_configuration);
            return Ok(productData.GetProductType());
        }

        public IActionResult GetPriceType()
        {

            //llamada al modelo para obtener los estudiantes
            productData = new ProductData(_configuration);
            return Ok(productData.GetPriceType());
        }

        public IActionResult AddProduct([FromBody] Product product)
        {
            productData = new ProductData(_configuration);
            return Ok(productData.AddProducts(product));
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
