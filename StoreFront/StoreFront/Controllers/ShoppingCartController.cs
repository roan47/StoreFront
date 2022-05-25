using Microsoft.AspNetCore.Mvc;
using DATA.Models;//added for access to the context
using Microsoft.AspNetCore.Identity;//added to access UserManager
using StoreFront.Models;//Added to access CartItemViewModel
using Newtonsoft.Json;//added to manage shopping cart

namespace GadgetStore.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        #region Steps to Implement Session Based Shopping Cart
        /*
         * 1) Register Session in program.cs (builder.Services.AddSession... && app.UseSession())
         * 2) Create the CartItemViewModel class in [ProjName].UI.MVC/Models folder
         * 3) Add the 'Add To Cart' button in the Index and/or Details view of your Products
         * 4) Create the ShoppingCartController (empty controller -> named ShoppingCartController)
         *      - add using statements
         *          - using GadgetStore.DATA.EF.Models;
         *          - using Microsoft.AspNetCore.Identity;
         *          - using GadgetStore.UI.MVC.Models;
         *          - using Newtonsoft.Json;
         *      - Add props for the GadgetStoreContext && UserManager
         *      - Create a constructor for the controller - assign values to context && usermanager
         *      - Code the AddToCart() action
         * */
        #endregion

        //properties
        private readonly StoreFrontContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        //ctor
        public ShoppingCartController(StoreFrontContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            ViewBag.Cart = HttpContext.Session.GetString("cart");
            return View();
        }

        public IActionResult AddToCart(int id)
        {
            //Empty shell for LOCAL shopping cart variable
            //int (key) -> Product ID
            //CartItemViewModel (value) -> Product & Qty
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            #region Session Notes
            /*
             * Session is a tool available on the server-side that can store information for a user while they are actively using your site.
             * Typically the session lasts for 20 minutes (this can be adjusted in Program.cs).
             * Once the 20 minutes is up, the session variable is disposed.
             * 
             * Values that we can store in Session are limited to: string, int
             * - Because of this we have to get creative when trying to store complex objects (like CartItemViewModel).
             * To keep the info separated into properties we will convert the C# object to a JSON string.
             * */
            #endregion

            var sessionCart = HttpContext.Session.GetString("cart");

            //Check to see if the session object exists
            //If not, instantiate the new local collection
            if (String.IsNullOrEmpty(sessionCart))
            {
                //if the session didn't exist yet, instantiate the collection as a new object
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            else
            {
                //Cart already exists - transfer the existing cart items from session into our local shoppingCart
                //DeserializeObject() is a method that converts JSON to C# - we MUST tell this method which C# class to 
                //convert the JSON into (here - Dictionary<int, CIVM>)
                shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);
            }

            // Add newly selected products to the cart
            // Retrieve product from the DB
            Product product = _context.Products.Find(id);

            // Instantiate the object so we can add to the cart
            CartItemViewModel civm = new CartItemViewModel(1, product);//add 1 of the selected product to the cart

            // If the product was already in the cart, increase the quantity by 1
            //Otherwise, add the new item to the cart
            if (shoppingCart.ContainsKey(product.ProductId))
            {
                //update qty
                shoppingCart[product.ProductId].Qty++;
            }
            else
            {
                shoppingCart.Add(product.ProductId, civm);
            }

            //update the session version of the cart
            //Take the local copy, and serialize it as JSON
            //Then assign that value to our session
            string jsonCart = JsonConvert.SerializeObject(shoppingCart);
            HttpContext.Session.SetString("cart", jsonCart);

            return RedirectToAction("Index");
        }
    }
}
