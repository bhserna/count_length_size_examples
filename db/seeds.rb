require "ffaker"
require_relative "config"
require_relative "../lib/models"

def create_list(klass, count:, &block)
  records_data = count.times.map(&block)
  ids = klass.insert_all(records_data, record_timestamps: true).map { |data| data["id"] }
  klass.where(id: ids)
end

def create_list_for_each_record(klass, records:, count:, &block)
  new_records_data = records.flat_map { |record| count.times.map { block.(record) } }
  ids = klass.insert_all(new_records_data, record_timestamps: true).map { |data| data["id"] }
  klass.where(id: ids)
end

posts = create_list(Post, count: 10) do
  { title: FFaker::CheesyLingo.title, body: FFaker::CheesyLingo.paragraph }
end

create_list_for_each_record(Comment, records: posts, count: 20) do |post|
  { post_id: post.id, body: FFaker::CheesyLingo.sentence }
end

create_list_for_each_record(Like, records: posts.sample(4), count: 20) do |post|
  { post_id: post.id }
end

Post.pluck(:id).each do |post_id|
  Post.reset_counters(post_id, :likes_count)
end