require_relative "config"

example "size, load" do
  post = Post.first
  post.likes.size
  post.likes.load
end

example "load, size" do
  post = Post.first
  post.likes.load
  post.likes.size
end

example "size, length" do
  post = Post.first
  post.likes.size
  post.likes.length
end

example "length, size" do
  post = Post.first
  post.likes.length
  post.likes.size
end

example "size, count" do
  post = Post.first
  post.likes.size
  post.likes.count
end

example "count, size" do
  post = Post.first
  post.likes.count
  post.likes.size
end

example "size, size" do
  post = Post.first
  post.likes.size
  post.likes.size
end

example "load.size, size" do
  post = Post.first
  post.likes.load.size
  post.likes.size
end

example "size, load.size" do
  post = Post.first
  post.likes.size
  post.likes.load.size
end

# Example: size, load
# -------------------
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.3ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: load, size
# -------------------
# Post Load (0.7ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.7ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, length
# ---------------------
# Post Load (13.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (6.8ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, size
# ---------------------
# Post Load (16.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (9.0ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, count
# --------------------
# Post Load (4.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (2.2ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: count, size
# --------------------
# Post Load (2.0ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (0.6ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, size
# -------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# 
# 
# Example: load.size, size
# ------------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.6ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, load.size
# ------------------------
# Post Load (1.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (2.1ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]