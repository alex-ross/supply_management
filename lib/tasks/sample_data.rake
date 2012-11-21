#!/bin/env ruby
# encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_user
    make_suppliers
  end
end

def make_user
  User.create(email: "demo@example.com", password: "foobar", password_confirmation: "foobar",
  address: "Västergatan 6", zip: "35230", city: "Växjö", country: "Sverige")
end

def make_suppliers
  10.times do |n|
    Supplier.create!(
      name: Faker::Company.name,
      address: "#{%w(Ny Stor).sample}gatan #{(3..30).to_a.sample}",
      zip: (1..5).to_a.shuffle.join,
      city: %w(Stockholm Kalmar Moheda).sample,
      email: Faker::Internet.email("info"),
      country: "Sverige",
      url: Faker::Internet.domain_name,
      category_names: %w(egg meat cake chicken cow bread fish flower).sample(3),
      note: Faker::Lorem.sentence((5..15).to_a.sample)
    )
  end
end
