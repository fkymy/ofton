# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create(author: 'yushi', body: 'test', comments_count: 0)
Post.create(author: 'yushi', body: 'test', comments_count: 0)
Post.create(author: 'yushi', body: 'test', comments_count: 0)
Post.create(author: 'yushi', body: 'test', comments_count: 0)

Comment.create(post_id: 1, author: 'yushi', body: 'test comment')
Comment.create(post_id: 1, author: 'yushi', body: 'test comment')
Comment.create(post_id: 1, author: 'yushi', body: 'test comment')
Comment.create(post_id: 2, author: 'yushi', body: 'test comment')
Comment.create(post_id: 2, author: 'yushi', body: 'test comment')
Comment.create(post_id: 3, author: 'yushi', body: 'test comment')
