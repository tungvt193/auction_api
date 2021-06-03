config = {
  host: ENV['ELASTIC_SEARCH_HOST'],
  transport_options: {
    request: { timeout: 5 }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
