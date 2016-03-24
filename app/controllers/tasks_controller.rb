class TasksController < ApplicationController 

  get '/tasks' do
    redirect_if_not_logged_in
    @user = current_user
    @lists = List.all
    #@tasks = List.tasks
    erb :'tasks/show'
  end

  get '/tasks/new' do
    redirect_if_not_logged_in
    erb :'/tasks/new'
  end

  get '/tasks/:id' do
    "Do a thing!"
  end
end