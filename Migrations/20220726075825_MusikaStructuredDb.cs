using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ECApi.Migrations
{
    public partial class MusikaStructuredDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Adress",
                table: "MusikaUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "City",
                table: "MusikaUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Coutry",
                table: "MusikaUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "ItemImages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImageName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImageURL = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MusikaItemId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemImages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemImages_MusikaItems_MusikaItemId",
                        column: x => x.MusikaItemId,
                        principalTable: "MusikaItems",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "ItemOrderhistories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ItemId = table.Column<int>(type: "int", nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: false),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AmountPaid = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemOrderhistories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemOrderhistories_MusikaUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "MusikaUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ItemReviews",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ItemId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Comment = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Rating = table.Column<int>(type: "int", nullable: false),
                    CommentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    MusikaItemId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemReviews", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemReviews_MusikaItems_MusikaItemId",
                        column: x => x.MusikaItemId,
                        principalTable: "MusikaItems",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_ItemImages_MusikaItemId",
                table: "ItemImages",
                column: "MusikaItemId");

            migrationBuilder.CreateIndex(
                name: "IX_ItemOrderhistories_UserId",
                table: "ItemOrderhistories",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ItemReviews_MusikaItemId",
                table: "ItemReviews",
                column: "MusikaItemId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ItemImages");

            migrationBuilder.DropTable(
                name: "ItemOrderhistories");

            migrationBuilder.DropTable(
                name: "ItemReviews");

            migrationBuilder.DropColumn(
                name: "Adress",
                table: "MusikaUsers");

            migrationBuilder.DropColumn(
                name: "City",
                table: "MusikaUsers");

            migrationBuilder.DropColumn(
                name: "Coutry",
                table: "MusikaUsers");
        }
    }
}
