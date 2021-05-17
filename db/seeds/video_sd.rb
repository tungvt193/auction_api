puts "START IMPORT VIDEO"

base_api = ENV['BASE_YOUTUBE_API_URL']
api_key = ENV['YOUTUBE_API_KEY']

url = "#{base_api}/search?key=#{api_key}&channelId=UCXLmXtc3U09RLP8tuvM1y-g&part=snippet,id&order=date&maxResults=100"

response = HTTParty.get(url)
now = Time.zone.now

if response.code == 200
  body = JSON.parse(response.body)

  video_attributes = body['items'].map do |item|
    snippet = item['snippet']
    video_id = item.fetch('id', {}).fetch('videoId', nil)

    next if video_id.blank?

    {
      title: snippet['title'],
      description: snippet['description'],
      cover_url: snippet.fetch('thumbnails', {}).fetch('medium', {}).fetch('url', ''),
      video_id: video_id,
      status: 1,
      created_at: now,
      updated_at: now
    }
  end.compact

  ::Video.insert_all!(video_attributes)
end

puts "FINISH IMPORT VIDEO SUCCESSFUL"