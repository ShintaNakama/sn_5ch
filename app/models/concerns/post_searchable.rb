module PostSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    INDEX_FIELDS = %w(title body).freeze
    index_name "es_post_#{Rails.env}"
    settings do
      mappings dynamic: 'false' do
        indexes :title, type: 'text', analyzer: 'kuromoji'
        indexes :body, type: 'text',  analyzer: 'kuromoji'
        indexes :comments, type: :object do
                  indexes :comment
        end
        indexes :categories, type: :object do
                  indexes :category_name
        end
      end
    end
    # インデックスするデータを生成
    # @return [Hash]
    def as_indexed_json(option = {})
      #self.as_json.select { |k, _| INDEX_FIELDS.include?(k) }
      self.as_json(
        include: {
          comments:   {only: :comment},
          categories: {only: :category_name}
        }
      )
    end
  end

  module ClassMethods
    # indexの作成メソッド
    def create_index!
      client = __elasticsearch__.client
      client.indices.delete index: self.index_name rescue nil
      client.indices.create(index: self.index_name,
      body: {
        settings: self.settings.to_hash,
        mappings: self.mappings.to_hash
      })
    end
  end
end
