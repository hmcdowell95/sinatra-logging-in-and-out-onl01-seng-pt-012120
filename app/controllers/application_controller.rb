require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/account'
    end
    erb :error
  end

  get '/account' do
    @user = User.find(session[:user_id])
    if @user.id == session[:user_id]
    erb :account
    end
    erb :error
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

