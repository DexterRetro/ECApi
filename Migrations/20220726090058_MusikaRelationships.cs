using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ECApi.Migrations
{
    public partial class MusikaRelationships : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_UserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropIndex(
                name: "IX_ItemOrderhistories_UserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "ItemOrderhistories");

            migrationBuilder.AddColumn<int>(
                name: "MusikaUserId",
                table: "ItemOrderhistories",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ItemOrderhistories_MusikaUserId",
                table: "ItemOrderhistories",
                column: "MusikaUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories",
                column: "MusikaUserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropIndex(
                name: "IX_ItemOrderhistories_MusikaUserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropColumn(
                name: "MusikaUserId",
                table: "ItemOrderhistories");

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "ItemOrderhistories",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_ItemOrderhistories_UserId",
                table: "ItemOrderhistories",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_UserId",
                table: "ItemOrderhistories",
                column: "UserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
