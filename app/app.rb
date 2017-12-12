ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    Link.create(url: params[:addlink], title: params[:link_name])
    redirect '/links'
  end

  run! if app_file == $0

end
