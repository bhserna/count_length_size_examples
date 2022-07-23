require_relative "config"

example "count, count" do
  post = Post.first
  post.comments.count
  post.comments.count
end

example "length, length" do
  post = Post.first
  post.comments.length
  post.comments.length
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

# Example: count, count
# ---------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.4ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: length, length
# -----------------------
# Post Load (0.5ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: length, count
# ----------------------
# Post Load (0.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (1.8ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (1.0ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: count, length
# ----------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.6ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: size, length
# ---------------------
# Post Load (0.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (2.9ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (2.7ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: length, size
# ---------------------
# Post Load (2.6ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (1.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: size, count
# --------------------
# Post Load (0.9ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.8ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: count, size
# --------------------
# Post Load (2.2ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.9ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: size, size
# -------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.6ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (1.1ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: load.size, size
# ------------------------
# Post Load (1.7ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (2.7ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: size, load.size
# ------------------------
# Post Load (0.8ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]