puts 'START INSERT COMPANY'
json_data = File.read(Rails.root.join('db/jsons/companies.json'))
companies = JSON.parse(json_data)
now = Time.zone.now
company_attributes = []

companies.each do |com|
  company_attributes << {
    name: com['name'],
    status: 1,
    created_at: now,
    updated_at: now
  }
end

Company.insert_all!(company_attributes)

puts 'FINISH INSERT COMPANY'
