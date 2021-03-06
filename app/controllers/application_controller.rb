require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])

    redirect to ('/posts')
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show'
  end


  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end




end
