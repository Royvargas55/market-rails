# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# leonel = User.new(
#     username: "leonelvega", 
#     email: "leonelvegavargas@hotmail.com", 
#     password: "leonelvega", 
#     password_confirmation: "leonelvega", 
#     role: 1) 
# leonel.save!
roy = User.new(
    username: "royvargas", 
    email: "royvargas55@gmail.com", 
    password: "royvargas", 
    password_confirmation: "royvargas", 
    role: 3) 
roy.save!
alex = User.new(
    username: "alex506", 
    email: "alex@gmail.com", 
    password: "alex123", 
    password_confirmation: "alex123") 
alex.save!
# Category.create( amount: "1 y 100 mil") 
# Category.create( amount: "100 mil y 1 millón") 
# Category.create( amount: "1 millón o más") 