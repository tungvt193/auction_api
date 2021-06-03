puts 'START IMPORT ADMINISTRATIVE DIVISION'

json_data = File.read(Rails.root.join('db/jsons/hanhchinh-vietnam.json'))
provinces = JSON.parse(json_data)
now = Time.zone.now

province_attributes = []
district_attributes = []
ward_attributes = []

provinces.each do |province|
  province_attributes.push({
                             id: province['Id'].to_i,
                             name: province['Name'],
                             created_at: now,
                             updated_at: now
                           })

  province['Districts'].each do |district|
    district_attributes.push({
                               id: district['Id'].to_i,
                               name: district['Name'],
                               province_id: province['Id'].to_i,
                               created_at: now,
                               updated_at: now
                             })

    district['Wards'].each do |ward|
      ward_attributes.push({
                             id: ward['Id'].to_i,
                             name: ward['Name'],
                             district_id: district['Id'].to_i,
                             created_at: now,
                             updated_at: now
                           })
    end
  end
end

Province.insert_all!(province_attributes)
District.insert_all!(district_attributes)
Ward.insert_all!(ward_attributes)

puts 'FINISH IMPORT ADMINISTRATIVE DIVISION'
