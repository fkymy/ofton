# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

body1 = "消えたいです\n生きてるのが辛いです\n何にも楽しくないです\nどうしたら前みたいに生きられるのかな？"
body2 = "寝れない状態が、続いてます。\n\n同じ感じの人いませんか。"
body3 = "恥の多い生涯を送って来ました。\n自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上って、降りて、そうしてそれが線路をまたぎ越えるために造られたものだという事には全然気づかず、ただそれは停車場の構内を外国の遊戯場みたいに、複雑に楽しく、ハイカラにするためにのみ、設備せられてあるものだとばかり思っていました。しかも、かなり永い間そう思っていたのです。ブリッジの上ったり降りたりは、自分にはむしろ、ずいぶん垢抜あかぬけのした遊戯で、それは鉄道のサーヴィスの中でも、最も気のきいたサーヴィスの一つだと思っていたのですが、のちにそれはただ旅客が線路をまたぎ越えるための頗る実利的な階段に過ぎないのを発見して、にわかに興が覚めました。\nどうにもできない情慾の種子を植えつけられた許ばかりに\n善だ悪だ罪だ罰だと呪のろわるるばかり\nどうにもできない只まごつくばかり\n抑え摧くだく力も意志も授けられぬ許りに"

User.create(username: 'ペソア', password: 'testtest')

Post.create(author: 'yushi', body: body1, user_id: 1)
Post.create(author: 'yushi', body: body2, user_id: 1)
Post.create(author: 'yushi', body: body3, user_id: 1)
Post.create(author: 'yushi', body: body1, user_id: 1)
Post.create(author: 'yushi', body: body2, user_id: 1)
Post.create(author: 'yushi', body: body3, user_id: 1)
Post.create(author: 'yushi', body: body1, user_id: 1)
Post.create(author: 'yushi', body: body2, user_id: 1)
Post.create(author: 'yushi', body: body3, user_id: 1)
Post.create(author: 'yushi', body: body1, user_id: 1)
Post.create(author: 'yushi', body: body2, user_id: 1)
Post.create(author: 'yushi', body: body3, user_id: 1)

Comment.create(post_id: 1, author: 'yushi', body: 'test comment', user_id: 1)
Comment.create(post_id: 1, author: 'yushi', body: 'test comment', user_id: 1)
Comment.create(post_id: 1, author: 'yushi', body: 'test comment', user_id: 1)
Comment.create(post_id: 2, author: 'yushi', body: 'test comment', user_id: 1)
Comment.create(post_id: 2, author: 'yushi', body: 'test comment', user_id: 1)
Comment.create(post_id: 3, author: 'yushi', body: 'test comment', user_id: 1)

Admin.create(email: 'test@example.com', password: 'testtest', name: 'test_admin')

User.create(username: 'test', password: 'testtest')
User.create(username: 'test2', password: 'testtest')
User.create(username: 'test3', password: 'testtest')
User.create(username: 'test4', password: 'testtest')
