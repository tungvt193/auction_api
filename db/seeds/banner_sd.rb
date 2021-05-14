puts 'START IMPORT BANNER'

10.times.map do |time|
  puts "MAKE BANNER #{time} / 10"

  banner = Banner.new({
                        status: 'active'
                      })

  banner.cover = Banner.download_file(time, 'https://source.unsplash.com/1600x900/?truck')
  banner.save!
end

puts 'FINISH IMPORT BANNER'
