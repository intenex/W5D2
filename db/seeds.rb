# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 5.times do 
#   User.create(username: Faker::Internet.unique.username,password:"password")
# end

ALL_USERS = User.all

# 5.times do 
#   Sub.create(title: Faker::Book.title, description: "this is the book we talkin about", moderator_id: all_users.sample.id)
# end

ALL_SUBS = Sub.all

def return_subs
  sub_ids = []
  ALL_SUBS.each do |sub|
    if rand > 0.5
      sub_ids << sub.id
    end
  end
  sub_ids
end

# 50.times do 
#   Post.create(title: Faker::Quote.famous_last_words, content: Faker::Quote.yoda, url: Faker::Internet.url, author_id: ALL_USERS.sample.id, sub_ids: return_subs)
# end

ALL_POSTS = Post.all

# 100.times do 
#   Comment.create(author_id: ALL_USERS.sample.id, post_id: ALL_POSTS.sample.id, content: Faker::Quote.most_interesting_man_in_the_world)
# end

ALL_PARENT_COMMENTS = Comment.all

# 1000.times do
#   Comment.create(author_id: ALL_USERS.sample.id, post_id: ALL_POSTS.sample.id, content: Faker::Quote.most_interesting_man_in_the_world, parent_comment_id: ALL_PARENT_COMMENTS.sample.id)
# end

ALL_CHILDREN_COMMENTS = Comment.all

# 10000.times do
#   Comment.create(author_id: ALL_USERS.sample.id, post_id: ALL_POSTS.sample.id, content: Faker::Quote.most_interesting_man_in_the_world, parent_comment_id: ALL_CHILDREN_COMMENTS.sample.id)
# end

ALL_GRANDCHILDREN_COMMENTS = Comment.all

100000.times do
  Comment.create(author_id: ALL_USERS.sample.id, post_id: ALL_POSTS.sample.id, content: Faker::Quote.most_interesting_man_in_the_world, parent_comment_id: ALL_GRANDCHILDREN_COMMENTS.sample.id)
end

