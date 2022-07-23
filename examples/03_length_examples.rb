require_relative "config"

example "length, length" do
  post = Post.first
  post.comments.length
  post.comments.length
end

example "load, length" do
  post = Post.first
  post.comments.load
  post.comments.length
end

example "length, load" do
  post = Post.first
  post.comments.length
  post.comments.load
end

example "to_a, length" do
  post = Post.first
  post.comments.to_a
  post.comments.length
end

example "length, to_a" do
post = Post.first
post.comments.length
post.comments.to_a
end

example "length, count" do
  post = Post.first
  post.comments.length
  post.comments.count
end

example "count, length" do
  post = Post.first
  post.comments.count
  post.comments.length
end

example "size, length" do
  post = Post.first
  post.comments.size
  post.comments.length
end

example "length, size" do
  post = Post.first
  post.comments.length
  post.comments.size
end

# Example: length, length
# -----------------------
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: load, length
# ---------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, load
# ---------------------
# Post Load (1.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: to_a, length
# ---------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (8.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, to_a
# ---------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, count
# ----------------------
# Post Load (5.2ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (1.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (2.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: count, length
# ----------------------
# Post Load (1.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (1.1ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, length
# ---------------------
# Post Load (0.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (3.0ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, size
# ---------------------
# Post Load (5.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (1.8ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 