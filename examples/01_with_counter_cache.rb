require_relative "config"

example "count, count" do
  post = Post.first
  post.likes.count
  post.likes.count
end

example "length, length" do
  post = Post.first
  post.likes.length
  post.likes.length
end

example "length, count" do
  post = Post.first
  post.likes.length
  post.likes.count
end

example "count, length" do
  post = Post.first
  post.likes.count
  post.likes.length
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

# Example: count, count
# ---------------------
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (0.6ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# Like Count (0.5ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, length
# -----------------------
# Post Load (2.0ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.3ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, count
# ----------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.3ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# Like Count (0.4ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: count, length
# ----------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (0.5ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# Like Load (2.2ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, length
# ---------------------
# Post Load (0.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.8ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: length, size
# ---------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.4ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, count
# --------------------
# Post Load (0.7ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (0.4ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: count, size
# --------------------
# Post Load (2.8ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Count (1.6ms)  SELECT COUNT(*) FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, size
# -------------------
# Post Load (1.1ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# 
# 
# Example: load.size, size
# ------------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.4ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]
# 
# 
# Example: size, load.size
# ------------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Like Load (0.5ms)  SELECT "likes".* FROM "likes" WHERE "likes"."post_id" = $1  [["post_id", 1]]