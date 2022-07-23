require_relative "config"

example "Preload counts" do
  # Given a list of posts
  posts = Post.limit(5)

  # 1. Filter the likes for those posts
  likes = Like.where(post_id: posts)

  # 2. Group by :post_id and count
  counts = likes.group(:post_id).count

  puts counts

  posts.each do |post|
    # 3. Find the likes count for the current post
    # 4. Fallback to zero if no count
    puts "Post: #{post.id}, likes: #{counts[post.id] || 0}"
  end
end

example "Preload counts with join" do
  # Given a list of posts
  posts = Post.limit(5)

  # 1. Join the likes
  # 2. Group by "posts.id" and count "likes.id"
  counts = posts.joins(:likes).group("posts.id").count("likes.id")

  puts counts

  posts.each do |post|
    # 3. Find the likes count for the current post
    # 4. Fallback to zero if no count
    puts "Post: #{post.id}, likes: #{counts[post.id] || 0}"
  end
end

example "Preload counts with left join" do
   # Given a list of posts
  posts = Post.limit(5)

  # 1. Left join the likes
  # 2. Group by "posts.id" and count "likes.id"
  counts = posts.left_joins(:likes).group("posts.id").count("likes.id")

  puts counts

  posts.each do |post|
    # 3. Find the likes count for the current post
    # You don't need fallback
    puts "Post: #{post.id}, likes: #{counts[post.id]}"
  end
end

example "Preload selecting the counts" do
  # Given a list of posts
  posts = Post.limit(5)

  # 1. Join the likes
  # 2. Select the posts and the likes count
  # 3. Group by posts.id
  posts = posts
    .left_joins(:likes)
    .select("posts.*, COUNT(likes.id) AS likes_count")
    .group("posts.id")

  posts.each do |post|
    # 4. Use post.likes_count
    # You don't need fallback
    puts "Post: #{post.id}, likes: #{post.likes_count}"
  end
end


class LikesCounts
  attr_reader :posts

  def initialize(posts)
    @posts = posts
  end

  def [](post)
    # 3. Find the likes count for the current post
    # 4. Fallback to zero if no count
    counts[post.id] || 0
  end

  def counts
    # 1. Filter the likes for those post
    # 2. Group by :post_id and count
    @counts ||= Like.where(post_id: posts).group(:post_id).count
  end
end

example "Preload object" do
  posts = Post.limit(5)
  counts = LikesCounts.new(posts)

  puts counts

  posts.each do |post|
    puts "Post: #{post.id}, likes: #{counts[post]}"
  end
end


# Example: Preload counts
# -----------------------
# Like Count (0.8ms)  SELECT COUNT(*) AS "count_all", "likes"."post_id" AS "likes_post_id" FROM "likes" WHERE "likes"."post_id" IN (SELECT "posts"."id" FROM "posts" LIMIT $1) GROUP BY "likes"."post_id"  [["LIMIT", 5]]
# {3=>20, 2=>20, 4=>20}
# Post Load (0.2ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Post: 1, likes: 0
# Post: 2, likes: 20
# Post: 3, likes: 20
# Post: 4, likes: 20
# Post: 5, likes: 0
# 
# 
# Example: Preload counts with join
# ---------------------------------
# Post Count (1.0ms)  SELECT COUNT("likes"."id") AS "count_likes_id", "posts"."id" AS "posts_id" FROM "posts" INNER JOIN "likes" ON "likes"."post_id" = "posts"."id" GROUP BY "posts"."id" LIMIT $1  [["LIMIT", 5]]
# {2=>20, 3=>20, 4=>20, 8=>20}
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Post: 1, likes: 0
# Post: 2, likes: 20
# Post: 3, likes: 20
# Post: 4, likes: 20
# Post: 5, likes: 0
# 
# 
# Example: Preload counts with left join
# --------------------------------------
# Post Count (0.4ms)  SELECT COUNT("likes"."id") AS "count_likes_id", "posts"."id" AS "posts_id" FROM "posts" LEFT OUTER JOIN "likes" ON "likes"."post_id" = "posts"."id" GROUP BY "posts"."id" LIMIT $1  [["LIMIT", 5]]
# {1=>0, 2=>20, 3=>20, 4=>20, 5=>0}
# Post Load (0.2ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Post: 1, likes: 0
# Post: 2, likes: 20
# Post: 3, likes: 20
# Post: 4, likes: 20
# Post: 5, likes: 0
# 
# 
# Example: Preload selecting the counts
# -------------------------------------
# Post Load (1.0ms)  SELECT posts.*, COUNT(likes.id) AS likes_count FROM "posts" LEFT OUTER JOIN "likes" ON "likes"."post_id" = "posts"."id" GROUP BY "posts"."id" LIMIT $1  [["LIMIT", 5]]
# Post: 1, likes: 0
# Post: 2, likes: 20
# Post: 3, likes: 20
# Post: 4, likes: 20
# Post: 5, likes: 0
# 
# 
# Example: Preload object
# -----------------------
# Post Load (0.7ms)  SELECT "posts".* FROM "posts" LIMIT $1  [["LIMIT", 5]]
# Like Count (0.4ms)  SELECT COUNT(*) AS "count_all", "likes"."post_id" AS "likes_post_id" FROM "likes" WHERE "likes"."post_id" IN (SELECT "posts"."id" FROM "posts" LIMIT $1) GROUP BY "likes"."post_id"  [["LIMIT", 5]]
# Post: 1, likes: 0
# Post: 2, likes: 20
# Post: 3, likes: 20
# Post: 4, likes: 20
# Post: 5, likes: 0
# 