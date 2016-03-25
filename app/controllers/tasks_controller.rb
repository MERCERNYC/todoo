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

  get '/tasks/new/:id' do
    redirect_if_not_logged_in
    @list = List.find_by_id(params[:id])
    erb :'/tasks/new_on_list'
  end

  post '/tasks/new/:id' do
    @list = List.find_by_id(params[:id])
    Task.create(:name => params[:name], :list_id => params[:id])
    redirect '/tasks'
  end

  post '/tasks/new' do
    Task.create(:name => params[:name], :list_id => params[:list_id])
    redirect '/tasks'
  end

  get '/tasks/:id/edit' do
    @task = Task.find_by_id(params[:id])
    erb :'/tasks/edit'
  end

  patch '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    @task.name = params[:name]
    @task.save
    redirect '/tasks'
  end

  get '/tasks/:id/delete' do 
    @task = Task.find_by_id(params[:id])
    erb :'/tasks/delete'
  end

  delete '/tasks/:id' do 
    @task = Task.find_by_id(params[:id])
    @task.destroy
    redirect '/tasks'
  end

end