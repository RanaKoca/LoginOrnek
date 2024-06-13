using LoginOrnek.Models;
using Microsoft.AspNetCore.Mvc;

namespace LoginOrnek.Controllers
{
    public class VeriListeleme : Controller
    {
        private readonly HastaContext _context;

        public VeriListeleme(HastaContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var hasta = _context.Hasta.ToList();
            return View(hasta);
        }
    }
}
