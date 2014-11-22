get '/message/all' do
  @messages = Message.where(receiver_id: session[:user_id])
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
