# app/models/concerns/searchable.rb

require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "#{Rails.env}_products"
    document_type name.downcase

    def create_index
      __elasticsearch__.index_document
    end

    def update_index
      __elasticsearch__.update_document
    end

    def delete_index
      __elasticsearch__.delete_document
    end
  end
end
