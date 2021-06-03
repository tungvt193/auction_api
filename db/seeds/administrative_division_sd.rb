puts 'START IMPORT ADMINISTRATIVE DIVISION'

json_data = File.read(Rails.root.join('db/jsons/hanhchinh-vietnam.json'))
provinces = JSON.parse(json_data)
now = Time.zone.now

provinces.each do |province|
  pro = Province.new(
    name: province['Name'],
    code: province['Id'],
    created_at: now,
    updated_at: now
  )
  pro.save!

  districts = province['Districts']
  districts.each do |district|
    dis = District.new(
      name: district['Name'],
      code: district['Id'],
      province_id: Province.find_by(code: province['Id']).id,
      created_at: now,
      updated_at: now
    )
    dis.save!

    wards = district['Wards']
    wards.each do |ward|
      next unless ward['Id'].presence

      wa = Ward.new(
        name: ward['Name'],
        code: ward['Id'],
        district_id: District.find_by(code: district['Id']).id,
        created_at: now,
        updated_at: now
      )
      wa.save!
    end
  end
end

puts 'FINISH IMPORT ADMINISTRATIVE DIVISION'
