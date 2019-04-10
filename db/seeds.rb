# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do 
  User.create(username: Faker::Internet.unique.username, password:"password")
end

ALL_USERS = User.all

5.times do 
  Sub.create(title: Faker::Book.title, description: "this is the book we talkin about", moderator_id: ALL_USERS.sample.id)
end

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

50.times do 
  Post.create(title: Faker::Quote.famous_last_words, content: Faker::Quote.yoda, url: Faker::Internet.url, author_id: ALL_USERS.sample.id, sub_ids: return_subs)
end

ALL_POSTS = Post.all

100.times do 
  Comment.create(author_id: ALL_USERS.sample.id, post_id: ALL_POSTS.sample.id, content: Faker::Quote.most_interesting_man_in_the_world)
end

ALL_PARENT_COMMENTS = Comment.all

@placeholder_parent_1 = nil

def return_random_parent_1
  @placeholder_parent_1 = ALL_PARENT_COMMENTS.sample
end

1000.times do
  Comment.create(author_id: ALL_USERS.sample.id, parent_comment_id: return_random_parent_1.id, post_id: @placeholder_parent_1.post_id, content: Faker::Quote.most_interesting_man_in_the_world)
end

ALL_CHILDREN_COMMENTS = Comment.all

@placeholder_parent_2 = nil

def return_random_parent_2
  @placeholder_parent_2 = ALL_CHILDREN_COMMENTS.sample
end

10000.times do
  Comment.create(author_id: ALL_USERS.sample.id, parent_comment_id: return_random_parent_2.id, post_id: @placeholder_parent_2.post_id, content: Faker::Quote.most_interesting_man_in_the_world)
end

ALL_GRANDCHILDREN_COMMENTS = Comment.all

@placeholder_parent_3 = nil

def return_random_parent_3
  @placeholder_parent_3 = ALL_GRANDCHILDREN_COMMENTS.sample
end

100000.times do
  Comment.create(author_id: ALL_USERS.sample.id, parent_comment_id: return_random_parent_3.id, post_id: @placeholder_parent_3.post_id, content: Faker::Quote.most_interesting_man_in_the_world)
end