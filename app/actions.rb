# Homepage (Root path)
get '/' do
  erb :index
end

get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  @post = Post.new(
    title: params[:title],
    url: params[:url],
    author: params[:author]
  )
  if @post.save
    redirect '/posts'
  else
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find params[:id]
  erb :'posts/show'
end