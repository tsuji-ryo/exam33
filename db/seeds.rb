10.times do |n|
  name = Faker::Friends.character
  email = Faker::Internet.email
  password = Faker::Internet.password
  uid = SecureRandom.uuid
  user = User.create(
    name: name,
    email: email,
    password: password,
    uid: uid
  )

  topic = Topic.new(
  content: 'トピック',
  user_id: user.id,
  image: Rails.root.join("db/fixtures/image1.png").open
  )

  10.times do
    topic.comments.build(
      content: 'コメント',
    user_id: user.id)
  end

  topic.save

end
