using LoginOrnek.Models;
using LoginOrnek.Models.Entities;
using Microsoft.AspNetCore.Mvc;

namespace LoginOrnek.Controllers
{
    public class AdminController : Controller
    {
        private readonly HastaContext _context;
        public AdminController(HastaContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult AddUser()

        {
            return View();
        }

        [HttpPost]
        public IActionResult AddUser(Hasta hasta)
        {
            if (ModelState.IsValid)
            {
                _context.Hasta.Add(hasta);
                _context.SaveChanges();
                return RedirectToAction("ViewUser");
            }
            return View(hasta);
        }

        public IActionResult ViewUser(Hasta hasta)
        {
            var hastalar = _context.Hasta.ToList();
            return View(hastalar);
        }

        public IActionResult SearchUser(string aranacakkullaniciadi = null)
        {
            IEnumerable<Hasta> hasta;

            if (!string.IsNullOrEmpty(aranacakkullaniciadi))
            {
                hasta = _context.Hasta.Where(u => u.KullaniciAdi.Contains(aranacakkullaniciadi)).ToList();
            }
            else
            {
                hasta = _context.Hasta.ToList();
            }

            return View(hasta);
        }


        public IActionResult EditUser()
        {
            var hasta = _context.Hasta.ToList();
            return View(hasta);
        }


        public IActionResult EditUserBul(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var hasta = _context.Hasta.Find(id);
            if (hasta == null)
            {
                return NotFound();
            }

            return PartialView("_EditUserModal", hasta);
        }


        [HttpPost]
        public IActionResult EditUserUpdate(Hasta hasta)
        {
            if (ModelState.IsValid)
            {
                _context.Update(hasta);
                _context.SaveChanges();
                return RedirectToAction("EditUser", "Hasta");
            }

            return PartialView("_EditUserModal", hasta);
        }

        public IActionResult DeleteUserBul(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var hasta = _context.Hasta.Find(id);
            if (hasta == null)
            {
                return NotFound();
            }

            return PartialView("_DeleteUserModal", hasta);
        }
        [HttpPost]
        public IActionResult DeleteUserUpdate(Hasta hasta)
        {
            if (ModelState.IsValid)
            {
                _context.Remove(hasta);
                _context.SaveChanges();
                return RedirectToAction("EditUser", "Hasta");
            }

            return PartialView("_DeleteUserModal", hasta);
        }
        //script yazmadan modal çağırdığımız view için yzılan actionresultlar
        public IActionResult EditUsermod()
        {
            var hasta = _context.Hasta.ToList();
            return View(hasta);
        }


        [HttpPost]
        public IActionResult EditUserUpdatemmod(Hasta hasta)
        {
            if (ModelState.IsValid)
            {
                _context.Update(hasta);
                _context.SaveChanges();
                return RedirectToAction("EditUsermod", "Hasta");
            }

            return PartialView("_EditUserModile", hasta);
        }
    }

}
