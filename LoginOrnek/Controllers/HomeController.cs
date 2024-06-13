using LoginOrnek.Models;
using LoginOrnek.Models.Entities;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;

namespace LoginOrnek.Controllers
{
    public class HomeController : Controller
    {
        // Basit bir örnek için kullanýcý bilgilerini statik olarak tutuyoruz
        private static List<User> users = new List<User>()
        {
            new User {Ad="Ali", Soyad="AK", Username = "admin", Password = "1234", YetkiTuru="Admin"},
            new User {Ad="Veli", Soyad="BEYAZ", Username = "user", Password = "5678", YetkiTuru="User"}
        };

        public IActionResult Index()
        {
            return View();
        }

        // Giriþ yapma sayfasýný göster
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string username, string password)
        {

            var user = users.FirstOrDefault(x => x.Username == username && x.Password == password);
            if (user != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.Username),
                    new Claim(ClaimTypes.Role, user.YetkiTuru),
                    new Claim("Ad", user.Ad ),
                    new Claim("Soyad", user.Soyad ),
                };

                var claimsIdentity = new ClaimsIdentity(claims, "CookieAuth");
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);

                await HttpContext.SignInAsync("CookieAuth", claimsPrincipal);

                return RedirectToAction("Index");
            }
            TempData["Error"] = "Kullanýcý adý ya da þifre hatalý";
            return View();
        }


        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync("CookieAuth");
            return RedirectToAction("Login");
        }

        [Authorize(AuthenticationSchemes = "CookieAuth")]
        public IActionResult Profile()
        {
            var user = GetUserFromCookie();
            return View(user);
        }

        [Authorize(Roles = "Admin")]
        public IActionResult AdminOnly()
        {
            return View();
        }

        [Authorize(Roles = "User")]
        public IActionResult UserOnly()
        {
            return View();
        }

        public IActionResult AccessDenied()
        {
            return View();
        }

        public User GetUserFromCookie()
        {
            User user = new User();
            if (User.Identity.IsAuthenticated)
            {
                user.Ad = User.Claims.FirstOrDefault(c => c.Type == "Ad")?.Value;
                user.Soyad = User.Claims.FirstOrDefault(c => c.Type == "Soyad")?.Value;
                user.Username = User.Identity.Name;
                user.YetkiTuru = User.FindFirst(ClaimTypes.Role).Value;
            }
            return user;
        }
    }
}
