namespace :elasticsearch do
  desc 'Elasticsearch のindex作成(post)'
  task :create_post_index => :environment do
    Post.create_index!
  end

  desc 'Elasticsearch のindex作成(comment)'
  task :create_comment_index => :environment do
    Comment.create_index!
  end

  desc 'Elasticsearch のindex作成(category)'
  task :create_category_index => :environment do
    Category.create_index!
  end
    
   desc 'Post を Elasticsearch に登録'
   task :import_post => :environment do
     Post.import
   end

   desc 'Comment を Elasticsearch に登録'
   task :import_comment => :environment do
     Comment.import
   end

   desc 'Category を Elasticsearch に登録'
   task :import_category => :environment do
     Category.import
   end
end
