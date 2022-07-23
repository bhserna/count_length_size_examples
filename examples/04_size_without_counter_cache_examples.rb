require_relative "config"

example "size, load" do
  post = Post.first
  post.comments.size
  post.comments.load
end

example "load, size" do
  post = Post.first
  post.comments.load
  post.comments.size
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

example "size, count" do
  post = Post.first
  post.comments.size
  post.comments.count
end

example "count, size" do
  post = Post.first
  post.comments.count
  post.comments.size
end

example "size, size" do
  post = Post.first
  post.comments.size
  post.comments.size
end

example "load.size, size" do
  post = Post.first
  post.comments.load.size
  post.comments.size
end

example "size, load.size" do
  post = Post.first
  post.comments.size
  post.comments.load.size
end

# Example: size, load
# -------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.8ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: load, size
# -------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, length
# ---------------------
# Post Load (1.2ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (2.5ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (1.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, size
# ---------------------
# Post Load (0.7ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, count
# --------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.0ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (1.9ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: count, size
# --------------------
# Post Load (1.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (2.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (2.1ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, size
# -------------------
# Post Load (1.1ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.8ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (1.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: load.size, size
# ------------------------
# Post Load (2.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (2.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, load.size
# ------------------------
# Post Load (2.0ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.8ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.8ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]