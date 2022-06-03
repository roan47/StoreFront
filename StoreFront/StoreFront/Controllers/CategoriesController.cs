using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DATA.Models;

namespace StoreFront.Controllers
{
    public class CategoriesController : Controller
    {
        private readonly StoreFrontContext _context;

        public CategoriesController(StoreFrontContext context)
        {
            _context = context;
        }

        // GET: Categories
        public async Task<IActionResult> Index()
        {
              return _context.Categories != null ? 
                          View(await _context.Categories.ToListAsync()) :
                          Problem("Entity set 'StoreFrontContext.Categories'  is null.");
        }
        //AJAX - Step 9 code the AjaxDelete action
        [AcceptVerbs("POST")]
        public JsonResult AjaxDelete(int id)
        {
            Category category = _context.Categories.Find(id);
            _context.Categories.Remove(category);
            _context.SaveChanges();

            string confirmMessage = $"Deleted the category {category.CategoryName} from the database!";
            return Json(new { id = id, message = confirmMessage });
        }

        //AJAX - Step 15 - Code the CategoryDetails action
        public PartialViewResult CategoryDetails(int id)
        {
            var category = _context.Categories.Find(id);
            return PartialView(category);
            //AJAX - Step 16 - Create the partial view
            //  - template: Details
            //  - model: Category
            //  - check 'Create as partial view'
            //  - minor view tweaks
        }

        //AJAX - Step 20 - code the AjaxCreate action -- return the category as JSON
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Category category)
        {
            _context.Categories.Add(category);
            _context.SaveChanges();

            return Json(category);

            //AJAX - Step 21 - create the partial view
            //  - Name: CategoryCreate
            //  - template: Create
            //  - model: Category
            //  - check 'Create as partial view'
        }


        //AJAX - Step 24 code the action that returns the partial view for edit
        [HttpGet]
        public PartialViewResult CategoryEdit(int id)
        {
            Category category = _context.Categories.Find(id);
            return PartialView(category);
            //AJAX - Step 25 - create the partial view
            //  - name: CategoryEdit
            //  - template: Edit
            //  - model: Category
            //  - check 'Create as partial view'
            //  - copious HTML modifications
        }

        //AJAX - Step 27 - code the POST AjaxEdit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Category category)
        {
            _context.Update(category);
            _context.SaveChanges();

            return Json(category);
        }


        //// GET: Categories/Details/5
        //public async Task<IActionResult> Details(int? id)
        //{
        //    if (id == null || _context.Categories == null)
        //    {
        //        return NotFound();
        //    }

        //    var category = await _context.Categories
        //        .FirstOrDefaultAsync(m => m.CategoryId == id);
        //    if (category == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(category);
        //}

        //// GET: Categories/Create
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Categories/Create
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("CategoryId,CategoryName,CategoryDescript")] Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _context.Add(category);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Edit/5
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null || _context.Categories == null)
        //    {
        //        return NotFound();
        //    }

        //    var category = await _context.Categories.FindAsync(id);
        //    if (category == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(category);
        //}

        //// POST: Categories/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("CategoryId,CategoryName,CategoryDescript")] Category category)
        //{
        //    if (id != category.CategoryId)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(category);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!CategoryExists(category.CategoryId))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Delete/5
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null || _context.Categories == null)
        //    {
        //        return NotFound();
        //    }

        //    var category = await _context.Categories
        //        .FirstOrDefaultAsync(m => m.CategoryId == id);
        //    if (category == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(category);
        //}

        //// POST: Categories/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    if (_context.Categories == null)
        //    {
        //        return Problem("Entity set 'StoreFrontContext.Categories'  is null.");
        //    }
        //    var category = await _context.Categories.FindAsync(id);
        //    if (category != null)
        //    {
        //        _context.Categories.Remove(category);
        //    }

        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        private bool CategoryExists(int id)
        {
          return (_context.Categories?.Any(e => e.CategoryId == id)).GetValueOrDefault();
        }
    }
}
