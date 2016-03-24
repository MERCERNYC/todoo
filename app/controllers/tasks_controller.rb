class TasksController < ApplicationController 

  get '/tasks' do
    redirect_if_not_logged_in
    @user = current_user
    @lists = List.all
    erb :'tasks/show'
  end

  get '/tasks/new' do
    redirect_if_not_logged_in
    @lists = List.all
    erb :'/tasks/new'
  end

  post '/tasks/new' do
    Task.create(:name => params[:name], :list_id => params[:list_id])
    redirect '/tasks'
  end

end