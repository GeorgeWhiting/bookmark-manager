ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  include BCrypt

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :sign_in
  end

  post '/sign_in' do
    @user =  User.first(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:error] = 'Invalid username or password'
      redirect '/'
    end
  end

  post '/users/new' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :new_user
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:error] = @user.errors.values.join("<br>")
      erb :new_user
    end
  end

  get '/links' do
    current_user
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.first_or_create(url: params[:addlink], title: params[:link_name])
    params[:tag].split(', ').each do |tag|
      a_tag = Tag.first_or_create(name: tag)
      link.tags << a_tag
    end
    link.save
    redirect '/links'
  end

  post '/tags' do
    redirect "/tags/#{params[:tag_name]}"
  end

  get '/tags/:tag_name' do
    tag = Tag.first(name: params[:tag_name])
    @links = tag ? tag.links : []
    erb :search_links
  end

  run! if app_file == $PROGRAM_NAME
end
