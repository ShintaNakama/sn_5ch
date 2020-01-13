module CommentSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    INDEX_FIELDS = %w(comment).freeze
    index_name "es_comment_#{Rails.env}"
    settings do
      mappings dynamic: 'false' do
        indexes :comment, type: 'text', analyzer: 'kuromoji'
      end
    end
    # インデックスするデータを生成
    # @return [Hash]
    def as_indexed_json(option = {})
      self.as_json.select { |k, _| INDEX_FIELDS.include?(k) }
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
