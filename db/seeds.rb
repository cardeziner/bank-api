# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@james = Customer.create(id: 1, name: "James")
@bob = Customer.create(id: 2, name: "Bob")
@account_1 = Account.create(balance: 1000, customer_id: @james.id)
@account_2 = Account.create(balance: 2000, customer_id: @bob.id)
Transfer.create(amount: 150, account_id: @account_1.id, recipient_account_id: @account_2.id )
