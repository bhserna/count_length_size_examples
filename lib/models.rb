class Post < ActiveRecord::Base
  has_many :comments
  has_many :likes
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

class Like < ActiveRecord::Base
  belongs_to :post, counter_cache: true
end
