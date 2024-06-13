﻿// <auto-generated />
using System;
using LoginOrnek.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace LoginOrnek.Migrations
{
    [DbContext(typeof(HastaContext))]
    [Migration("20240519112319_InitialCreate")]
    partial class InitialCreate
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("LoginOrnek.Models.Hasta", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("id"));

                    b.Property<string>("Ad")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("IlacAdi")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("KullaniciAdi")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sifre")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Soyad")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("id");

                    b.ToTable("Hasta");
                });

            modelBuilder.Entity("LoginOrnek.Models.Ilac", b =>
                {
                    b.Property<int>("IlacId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IlacId"));

                    b.Property<int?>("Hastaid")
                        .HasColumnType("int");

                    b.Property<string>("IlacAdi")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IlacId");

                    b.HasIndex("Hastaid");

                    b.ToTable("Ilaclar");
                });

            modelBuilder.Entity("LoginOrnek.Models.Ilac", b =>
                {
                    b.HasOne("LoginOrnek.Models.Hasta", null)
                        .WithMany("Ilaclar")
                        .HasForeignKey("Hastaid");
                });

            modelBuilder.Entity("LoginOrnek.Models.Hasta", b =>
                {
                    b.Navigation("Ilaclar");
                });
#pragma warning restore 612, 618
        }
    }
}
