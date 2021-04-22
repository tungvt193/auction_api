puts "START IMPORT BANNER"


now = Time.zone.now

10.times.map do |time|
  "MAKE BANNER #{time} / 10"
  banner = Banner.new({
    status: 'active'
  })

  banner.cover = Banner.download_image(time, 'https://source.unsplash.com/1600x900/?nature,water,cover')
  banner.save!
end


puts "FINISH IMPORT BANNER"