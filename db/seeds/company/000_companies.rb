test_companies = [
  "Leada",
  "Test Company",
]

test_companies.each do |name|
  company = Company.where(name: name).first_or_create
  puts "Created company: #{company.name}"
end
