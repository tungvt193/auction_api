# app/models/concerns/searchable.rb

require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    document_type name.downcase
    index_name "#{Rails.env}_products"

    def self.search(field, keyword)
      __elasticsearch__.search({
                                 query: {
                                   match: {
                                     field => "%#{keyword}%"
                                   }
                                 },
                                 highlight: {
                                   fields: {
                                     field => {}
                                   }
                                 }
                               })
    end

    def create_index
      return if skip_callback == 'create'

      __elasticsearch__.client.indices.create \
        index: self.class.index_name,
        body: {
          settings: self.class.settings.to_hash,
          mappings: self.class.mappings.to_hash
        }
    rescue StandardError
      nil
    end

    def update_index
      return if skip_callback == 'update'

      __elasticsearch__.client.indices.update \
        index: self.class.index_name,
        body: {
          settings: self.class.settings.to_hash,
          mappings: self.class.mappings.to_hash
        }
    rescue StandardError
      nil
    end

    def delete_index
      self.class.__elasticsearch__.client.indices.delete index: self.class.index_name
    rescue StandardError
      nil
    end
  end
end
