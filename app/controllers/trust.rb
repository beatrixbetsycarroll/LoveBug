post '/trust/:user_a/:user_b' do |user_a, user_b|
  puts "user_a: #{user_a}, user_b: #{user_b}"
  puts "session: #{session}"
  puts "params: #{params}"

  TrustRelationship.create(user_a: User.find(user_a.to_i), user_b: nil)

  Message.create(sender_id: User.find_by(user_name: "LoveBug").id, receiver_id: user_b.to_i, content: %Q{ #{User.find(user_a.to_i).user_name} wants to trust you. Do you accept? <form action="/trust/confirm/#{user_b}/#{user_a}" method="POST"><input type="submit" value="Accept"></form>  <form action="/trust/reject/#{user_b}/#{user_a}" method="POST"><input type="submit" value="Reject"></form>})
  redirect('/message/all')
end

post '/trust/confirm/:confirming_user_id/:sender_id' do |confirming_user_id, sender_id|
  target_relationship = TrustRelationship.find_by(user_a: sender_id.to_i)
  target_relationship.update(user_b: User.find(confirming_user_id.to_i))
  Message.where('sender_id = ? AND receiver_id = ?', User.find_by(user_name: "LoveBug").id, confirming_user_id.to_i).destroy_all
  redirect("/user/#{sender_id}")
end

post '/trust/reject/:confirming_user_id/:sender_id' do |confirming_user_id, sender_id|
  target_relationship = TrustRelationship.find_by(user_a: sender_id.to_i)
  target_relationship.destroy
  Message.where('sender_id = ? AND receiver_id = ?', User.find_by(user_name: "LoveBug").id, confirming_user_id.to_i).destroy_all
  redirect("message/all")
end
