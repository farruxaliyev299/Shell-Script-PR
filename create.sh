#!/bin/bash

dir=$(pwd)
dirname="$(basename "$dir")"
mkdir $dirname

dotnet new mvc -lang C# -n $dirname

dotnet new sln
dotnet sln add $dirname/$dirname.csproj

cd $dirname
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 6.0.11
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 6.0.11

mkdir Models
cd Models/
touch Product.cs
touch Category.cs


#Product class
echo "namespace $dirname.Models;" > Product.cs
echo " " >> Product.cs
echo "public class Product" >> Product.cs
echo "{" >> Product.cs
echo "    public int ProductId { get; set; }" >> Product.cs
echo "    public string Name { get; set; }" >> Product.cs
echo "}" >> Product.cs

#Category class
echo "namespace $dirname.Models;" > Category.cs
echo " " >> Category.cs
echo "public class Category" >> Category.cs
echo "{" >> Category.cs
echo "    public int CategoryId { get; set; }" >> Category.cs
echo "    public string CategoryName { get; set; }" >> Category.cs
echo "    public string CategoryDescription { get; set; }" >> Category.cs
echo "}" >> Category.cs