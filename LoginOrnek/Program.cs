using LoginOrnek.Models;
using Microsoft.EntityFrameworkCore;

namespace LoginOrnek
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            var configuration = builder.Configuration;
            var connectionString = configuration.GetValue<string>("Data:ConnectionStrings:Connection");
            builder.Services.AddDbContext<HastaContext>(options => options.UseSqlServer(connectionString));
            // Add services to the container.
            builder.Services.AddControllersWithViews();

            //Microsoft.AspNetCore.Authentication.Cookies paketini yükleyin
            builder.Services.AddAuthentication("CookieAuth")
                .AddCookie("CookieAuth", options =>
                {
                    options.Cookie.Name = "YourCookieName";
                    options.LoginPath = "/Home/Login"; // Kullanýcý yetkisiz bir sayfaya eriþmeye çalýþtýðýnda yönlendirileceði yol
                    options.ExpireTimeSpan = TimeSpan.FromMinutes(60); // Cookie'nin geçerlilik süresi
                    options.AccessDeniedPath = "/Home/AccessDenied"; //Yetkisi olmayan bir sayfaya girmek istediðinde
                });

            builder.Services.AddAuthorization(options =>
            {
                options.AddPolicy("RequireAdminRole", policy => policy.RequireRole("Admin"));
                options.AddPolicy("RequireUserRole", policy => policy.RequireRole("User"));
            });

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            



            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            // Kimlik doðrulamayý uygulamak için
            app.UseAuthentication();
            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
