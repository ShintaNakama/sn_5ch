config = {
  host:  ENV['ELASTICSEARCH_HOST'] || "es01:9200/",
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)

#include Elasticsearch::Model

#index_name =  "sn_5ch_#{Rails.env}"

#client = __elasticsearch__.client
#client.indices.delete index: index_name rescue nil
#client.indices.create(index: index_name)

#Elasticsearch::Model.client = Elasticsearch::Client.new({log: true, hosts: { host: 'myapp-elasticsearch'}})
#Elasticsearch::Model.client = Elasticsearch::Client.new log: true
#Elasticsearch::Model.client = Elasticsearch::Client.new({host: 'es01:9200/'})
#Post.__elasticsearch__.create_index! force: true
#Comment.__elasticsearch__.create_index! force: true
#Category.__elasticsearch__.create_index! force: true
#Post.import
#Comment.import
#Category.import
