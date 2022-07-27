using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ECApi.Migrations
{
    public partial class MusikaMods : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ItemDescription",
                table: "MusikaItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "ItemQues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AddedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    MusikaUserId = table.Column<int>(type: "int", nullable: true),
                    MusikaUserId1 = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ItemQues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ItemQues_MusikaUsers_MusikaUserId",
                        column: x => x.MusikaUserId,
                        principalTable: "MusikaUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_ItemQues_MusikaUsers_MusikaUserId1",
                        column: x => x.MusikaUserId1,
                        principalTable: "MusikaUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_ItemQues_MusikaUserId",
                table: "ItemQues",
                column: "MusikaUserId");

            migrationBuilder.CreateIndex(
                name: "IX_ItemQues_MusikaUserId1",
                table: "ItemQues",
                column: "MusikaUserId1");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ItemQues");

            migrationBuilder.DropColumn(
                name: "ItemDescription",
                table: "MusikaItems");
        }
    }
}
