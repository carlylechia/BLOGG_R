# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# lorem = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, 
# totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
# Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui 
# ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci 
# velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 
# Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea
# commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, 
# vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

# images = [
#     'https://images.unsplash.com/photo-1660503427782-f9c627e7066e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1660536754523-13d686a48178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=857&q=80'
# ]

# --- Create Users ---
# first_user = User.create(name: 'Tom', photo: images[0], bio: 'Teacher from Mexico.', email: 'tom@dev.com', posts_count: 0)
# second_user = User.create(name: 'Lilly', photo: images[1], bio: 'Teacher from Poland.', email: 'lilly@prof.com', posts_count: 0)
# third_user = User.create(name: 'Path', photo: images[2], bio: 'Teacher from France.', email: 'path@prof.com', posts_count: 0)


# # --- Create Posts ---
# User.all.each do |user|
#     4.times do |post|
#         Post.create(
#             title: Faker::Quote.famous_last_words, 
#             text: lorem, user_id: user.id
#         )
#     end
# end


# # --- Create Comments ---
# Post.all.each do |post|
#     User.all.each do |user|
#         if post.id.even?
#             2.times do |comment|
#                 Comment.create(
#                     text: Faker::Quote.famous_last_words, post_id: post.id, user_id: user.id
#                 )
#             end
#         end
#     end
# end

# # --- Query ---
# # Count comments on post where id equals 10

# # post = Post.find_by(id: 10)
# # post.comments.count

# # Count all posts of user with id 3
# # user = User.find_by(id: 3)
# # user.posts.count

# # delete all comments where user_id is odd
# # Comment.where("user_id%2 != 0").destroy_all

# # update

# url = 'https://unsplash.com/photos/jJlb9KW7SQQ'
# user = User.find_by(name: "Tom").update(photo: url)

# images = [
#     'https://images.unsplash.com/photo-1660503427782-f9c627e7066e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1660536754523-13d686a48178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=857&q=80'
# ]

# i = 0
# User.all.each do |user|
#     user.update(photo: images[i])
#     i += 1
# end

# user = User.find_by(id: 2)
# user.posts.create(
#     title: Faker::Lorem.sentence(word_count: 3), 
#     text: Faker::Quote.famous_last_words, user_id: user.id
# )
