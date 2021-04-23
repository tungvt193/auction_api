puts 'START INSERT COMPANY'

names = ['KOMATSU', 'HITACHI', 'KOBELCO', 'CATERPILLAR', 'KUBOTA', 'SUMITOMO', 'YANMAR', 'IHI', 'FURUKAWA', 'UNICARRIERS', 'MITSUNBISHI', 'TCM', 'MITSUBIHI', 'KAWASAKI', 'ZINAN', 'TOYOTA', 'IWAFUJI', 'MOROOKA', 'KATO', 'TADANO', 'MIKASA', 'SAKAI', 'MITSUBISHI', 'DYNAPAC', 'NIIGATA', 'KANTO', 'NISSAN', 'WIGGINS', 'AIRMAN', 'DENYO', 'YAMABIKO', 'NISSHA', 'SHINDAIWA', 'AIRAMAN', 'NIPPONSHARYO', 'rosenbauer', 'ISUZU', 'HINO', 'MAZDA', 'NIPPON FRUEHAUF', 'FUSO', 'N/A', 'BRIDGESTONE', 'MARUJUN', 'OKADA', 'NPK', 'KONAN', 'GIKEN', 'DAIKIN', 'MATSUMOTO', 'TOMINAGA', 'IIDA', 'SHIN NIHON', 'JLG', 'ZENOAH', 'VOLVO', 'OOMACHI', 'NAKAMICHI HOUSE', 'BARONESS', 'SKYJACK', 'NICHIJYO', 'TIMAN', 'TOYO RYUKI', 'ISEKI', 'MAEDA', 'OHASHI', 'TENNANT', 'ATLAS COPCO', 'FORD', 'OHARA', 'KENCHO', 'AIKI', 'TOA DENKI']

now = Time.zone.now
company_attributes = []

names.each do |n|
  company_attributes << {
    name: n,
    status: 1,
    created_at: now,
    updated_at: now
  }
end

Company.insert_all!(company_attributes)

puts 'FINISH INSERT COMPANY'
