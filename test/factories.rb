Factory.define :user do |f|
  f.email 'user%d@example.com'
  f.password f.password_confirmation('password')
end

Factory.define :supplier do |f|
  f.name    "Supplier%d"
  f.phone   (0..9).to_a.shuffle.join
  f.email   'info@%{name}.com'
  f.address { "#{%w[Stor Ny].sample}gatan #{(1..20).to_a.sample}" }
  f.zip     (1..5).to_a.shuffle.join
  f.city    "Kalmar"
  f.country "Sverige"
  f.url     "www.ica.se"
end

Factory.define :category do |f|
  f.name "Category%d"
end