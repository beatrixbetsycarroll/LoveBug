get '/message/all' do
  erb :'message/all'
end


get '/message/new' do
  erb :'message/new'
end

post '/message/new' do
  @message = Message.new(params[:message])
    if @message.save
      redirect('message/all')
    else
      session[:error] = message.errors.messages
      redirect('message/new')
    end
end
