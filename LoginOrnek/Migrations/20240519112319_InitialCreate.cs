using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LoginOrnek.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Hasta",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Ad = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Soyad = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IlacAdi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KullaniciAdi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Sifre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hasta", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Ilaclar",
                columns: table => new
                {
                    IlacId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IlacAdi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Hastaid = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ilaclar", x => x.IlacId);
                    table.ForeignKey(
                        name: "FK_Ilaclar_Hasta_Hastaid",
                        column: x => x.Hastaid,
                        principalTable: "Hasta",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Ilaclar_Hastaid",
                table: "Ilaclar",
                column: "Hastaid");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Ilaclar");

            migrationBuilder.DropTable(
                name: "Hasta");
        }
    }
}
