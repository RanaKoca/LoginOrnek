namespace LoginOrnek.Models
{
    public class Hasta
    {
        public int id { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string IlacAdi { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
        public ICollection<Ilac>? Ilaclar { get; set; }
    }
}
