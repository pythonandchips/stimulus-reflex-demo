# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationRecord.transaction do
  contact = Contact.create!(
    id: 1,
    name: "Richard O'brien",
    email_address: "riff@raff.com",
    city: "Dark City",
    county: "Cheltenham",
    postcode: "CH10 1UI"
  )

  Contact.create!(
    id: 2,
    name: "Tim Curry",
    email_address: "tim@curry.com",
    city: "Grappenhall",
    county: "Cheshire",
    postcode: "CH13 3EQ"
  )

  Contact.create!(
    id: 3,
    name: "Nell Campbell",
    email_address: "nell@campbell.com",
    city: "Sydney",
    county: "New South Wales",
    postcode: "SY9 3IL"
  )

  Contact.create!(
    id: 4,
    name: "Susan Sarandon",
    email_address: "janet@weiss.com",
    city: "New York City",
    county: "New York",
    postcode: "SY9 3IL"
  )

  invoice = Invoice.create!(
    {
      id: 1,
      reference: "REF100",
      dated_on: Date.new,
    }.merge(
      contact.attributes.slice(
        "name", "email_address", "city", "county", "postcode"
      )
    )
  )

  invoice.items.create!(
    invoice: invoice,
    description: "Hammers",
    price: 100,
    quantity: 10
  )

  invoice.emails.create(
    sent_to: contact.email_address,
    status: "delivered",
    delivered_at: DateTime.now
  )
end
