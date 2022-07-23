require_relative "config"

# Examples without counter cache

example "count, count" do
  post = Post.first
  post.comments.count
  post.comments.count
end

example "count, load" do
  post = Post.first
  post.comments.count
  post.comments.load
end

example "load, count" do
  post = Post.first
  post.comments.load
  post.comments.count
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

# Example: count, count
# ---------------------
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.6ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.3ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: count, load
# --------------------
# Post Load (0.3ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.4ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.6ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: load, count
# --------------------
# Post Load (0.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.3ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.5ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: length, count
# ----------------------
# Post Load (4.4ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Load (0.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (0.5ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: count, length
# ----------------------
# Post Load (2.8ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (0.6ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Load (0.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: size, count
# --------------------
# Post Load (0.8ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (2.7ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (1.0ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]


# Example: count, size
# --------------------
# Post Load (2.1ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT $1  [["LIMIT", 1]]
# Comment Count (1.2ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]
# Comment Count (2.9ms)  SELECT COUNT(*) FROM "comments" WHERE "comments"."post_id" = $1  [["post_id", 1]]