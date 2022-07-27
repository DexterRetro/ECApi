global using ECApi.Data;
global using ECApi.Models;
global using ECApi.Repositories;
global using Microsoft.EntityFrameworkCore;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddCors(options=>{options.AddPolicy("CorImplementationpolicyOrigins",builder=>
    builder.WithOrigins("*").AllowAnyHeader().WithHeaders("*"));
});

builder.Services.AddControllers();
builder.Services.AddScoped<IMusikaItemRepository,MusikaItemRepository>();
builder.Services.AddScoped<IMusikaUserRepository,MusikaUserRepository>();
builder.Services.AddDbContext<DataContext>(options =>{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseCors("CorImplementationpolicyOrigins");
app.MapControllers();

app.Run();
