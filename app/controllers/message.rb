get '/message/all' do
  @user_messages = Message.where("sender_id = ? OR receiver_id = ?", session[:user_id], session[:user_id])
  @conversation_participant = @user_messages.map { |msg| [msg.sender, msg.receiver] }.flatten.uniq - [User.find(session[:user_id])]
  # is this equiv?
  # @messages = User.find(session[:id]).messages
  erb :'message/all'
end

get '/message/:id/new' do |id|
  @receiver = User.find(id)
  erb :'message/new'
end

post '/message/:receiver_id/new' do |receiver_id|

  @message = Message.new(params[:message])
  @message.sender_id = session[:user_id]
  @message.receiver_id = receiver_id.to_i
    if @message.save
      redirect('message/all')
    else
      session[:errors] = message.errors.messages
      redirect('message/new')
    end
end
