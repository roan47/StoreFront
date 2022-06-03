using Microsoft.AspNetCore.Mvc;
using DATA.Models;//added for access to the context
using Microsoft.AspNetCore.Identity;//added to access UserManager
using StoreFront.Models;//Added to access CartItemViewModel
using Newtonsoft.Json;//added to manage shopping cart

namespace StoreFront.Controllers
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
        {  //retreive the content from the session shopping cart (stored as JSON) and convert those to C# via Newtonsoft.Json
            //After converting to C#, we can pass the collection of cart contents back to the strongly-typed view to display

            //retrieve cart contents
            var sessionCart = HttpContext.Session.GetString("cart");

            //create the shell for the local (C# version) pf the cart
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //check to see if the session cart equals null
            if (sessionCart == null || sessionCart.Count() == 0)
            {
                //user either hasnt put anything in the cart, or they have removed all items
                //set shoppingCart to an empty object
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                ViewBag.Message = "There are no items in your cart";
            }
            else
            {

                ViewBag.Message = null;
                //deserialize the cart contents from JSON to C#

                shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            }


            return View(shoppingCart);
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


        public IActionResult RemoveFromCart(int id)
        {
            //retrieve the cart from session
            var sessionCart = HttpContext.Session.GetString("cart");

            //convert JSON cart to C#
            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            ////remove cart item
            shoppingCart.Remove(id);

            //if there are no remaining items in the cart, remove it from session
            if (shoppingCart.Count == 0)
            {
                HttpContext.Session.Remove("cart");

            }
            //otherwise, update the session variable with our local cart contains
            else
            {
                string jsonCart = JsonConvert.SerializeObject(shoppingCart);
                HttpContext.Session.SetString("cart", jsonCart);

            }
            return RedirectToAction("Index");

        }


        public IActionResult UpdateCart(int productId, int qty)
        {
            var sessionCart = HttpContext.Session.GetString("cart");

            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            //update the qty for our specific dictionary key
            shoppingCart[productId].Qty = qty;

            //update session
            string jsonCart = JsonConvert.SerializeObject(shoppingCart);

            HttpContext.Session.SetString("cart", jsonCart);

            return RedirectToAction("Index");



        }

        public async Task<IActionResult> SubmitOrder()
        {

            #region planing out order submission

            //Big picture plan
            //Create order object -> then save to the 
            //-ORder date
            //-UserId
            //- ShipCity,ShipState,ShipZip --> this info needs to be pulled from the USerDetails record
            // Asdd the record to _context
            //sAVE Db changes


            //Create the OrderPRoducts object for each item in the cart
            //- ProductId -> availble from cart

            //- OrderId ->
            // -QTY
            // - ProductPrice

            #endregion

            //Retrieve current user's Id
            //This is a mechanism provided by identity ton retrieve the Usser ID in the current HttpContext
            //If you need to retrieve the ID in ANY Controller you can use this

            string? userId = (await _userManager.GetUserAsync(HttpContext.User))?.Id;

            //Retrieve the UserDetails record 
            User ud = _context.Users.Find(userId);

            //Create the Order object and assign values
            Order o = new Order()
            {
                UserId = userId,
                Address = ud.Adress,

                
                City = ud.City,

                State = ud.State,
                Country = ud.Country,
                Zip = ud.Zip,
               
                
                
               


            };


            _context.Orders.Add(o);


            //Retrieve the session cart
            var sessionCart = HttpContext.Session.GetString("cart");
            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            //Creater OrderProduct object for each record in the cart
            foreach (var item in shoppingCart)
            {
                OrderDetail op = new OrderDetail()
                {
                    OrderId = o.OrderId,
                    ProductId = item.Key,
                    Pprice = item.Value.Product.Pprice,
                    Quantity = (short)item.Value.Qty
                };

                o.OrderDetails.Add(op);

            }

            _context.SaveChanges();
            return RedirectToAction("Index", "Orders");




        }




    }
}
