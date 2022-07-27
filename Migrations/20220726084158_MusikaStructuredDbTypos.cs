using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ECApi.Migrations
{
    public partial class MusikaStructuredDbTypos : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Coutry",
                table: "MusikaUsers",
                newName: "Country");

            migrationBuilder.RenameColumn(
                name: "Adress",
                table: "MusikaUsers",
                newName: "Address");

            migrationBuilder.CreateIndex(
                name: "IX_ItemOrderhistories_ItemId",
                table: "ItemOrderhistories",
                column: "ItemId");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemOrderhistories_MusikaItems_ItemId",
                table: "ItemOrderhistories",
                column: "ItemId",
                principalTable: "MusikaItems",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ItemOrderhistories_MusikaItems_ItemId",
                table: "ItemOrderhistories");

            migrationBuilder.DropIndex(
                name: "IX_ItemOrderhistories_ItemId",
                table: "ItemOrderhistories");

            migrationBuilder.RenameColumn(
                name: "Country",
                table: "MusikaUsers",
                newName: "Coutry");

            migrationBuilder.RenameColumn(
                name: "Address",
                table: "MusikaUsers",
                newName: "Adress");
        }
    }
}
