ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.first_or_create(url: params[:addlink], title: params[:link_name])
    params[:tag].split(", ").each do |tag|
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

  run! if app_file == $0

end
