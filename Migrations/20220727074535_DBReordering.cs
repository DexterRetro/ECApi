using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ECApi.Migrations
{
    public partial class DBReordering : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ItemImages_MusikaItems_MusikaItemId",
                table: "ItemImages");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemQues_MusikaUsers_MusikaUserId",
                table: "ItemQues");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemReviews_MusikaItems_MusikaItemId",
                table: "ItemReviews");

            migrationBuilder.DropColumn(
                name: "ItemId",
                table: "ItemReviews");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "ItemReviews");

            migrationBuilder.AlterColumn<int>(
                name: "MusikaItemId",
                table: "ItemReviews",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<string>(
                name: "Commentor",
                table: "ItemReviews",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<int>(
                name: "MusikaUserId",
                table: "ItemQues",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "MusikaUserId",
                table: "ItemOrderhistories",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "MusikaItemId",
                table: "ItemImages",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemImages_MusikaItems_MusikaItemId",
                table: "ItemImages",
                column: "MusikaItemId",
                principalTable: "MusikaItems",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories",
                column: "MusikaUserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemQues_MusikaUsers_MusikaUserId",
                table: "ItemQues",
                column: "MusikaUserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ItemReviews_MusikaItems_MusikaItemId",
                table: "ItemReviews",
                column: "MusikaItemId",
                principalTable: "MusikaItems",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ItemImages_MusikaItems_MusikaItemId",
                table: "ItemImages");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemQues_MusikaUsers_MusikaUserId",
                table: "ItemQues");

            migrationBuilder.DropForeignKey(
                name: "FK_ItemReviews_MusikaItems_MusikaItemId",
                table: "ItemReviews");

            migrationBuilder.DropColumn(
                name: "Commentor",
                table: "ItemReviews");

            migrationBuilder.AlterColumn<int>(
                name: "MusikaItemId",
                table: "ItemReviews",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ItemId",
                table: "ItemReviews",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "ItemReviews",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "MusikaUserId",
                table: "ItemQues",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MusikaUserId",
                table: "ItemOrderhistories",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MusikaItemId",
                table: "ItemImages",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ItemImages_MusikaItems_MusikaItemId",
                table: "ItemImages",
                column: "MusikaItemId",
                principalTable: "MusikaItems",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ItemOrderhistories_MusikaUsers_MusikaUserId",
                table: "ItemOrderhistories",
                column: "MusikaUserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ItemQues_MusikaUsers_MusikaUserId",
                table: "ItemQues",
                column: "MusikaUserId",
                principalTable: "MusikaUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ItemReviews_MusikaItems_MusikaItemId",
                table: "ItemReviews",
                column: "MusikaItemId",
                principalTable: "MusikaItems",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
