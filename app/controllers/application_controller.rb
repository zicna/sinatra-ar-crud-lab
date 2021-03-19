
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #index
  get '/articles' do
    #binding.pry
    @articles = Article.all

    erb :index
  end

  #new
  get '/articles/new' do 
    @article = Article.new
    erb :new
  end

  #create
  post '/articles' do
    
    @article = Article.create(params)
    # @article.title = params[:title]
    # @article.content = params[:content]

    redirect to "/articles/#{@article.id}"
  end

  #show
  get '/articles/:id' do 
    @article = Article.all.find(params[:id])

    erb :show
  end
  #edit
  get '/articles/:id/edit' do
    @article = Article.all.find(params[:id])
    erb :edit 
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end
end
