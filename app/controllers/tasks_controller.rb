class TasksController < ApplicationController 

  get '/tasks' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'tasks/show'
  end

  get '/tasks/new' do
    redirect_if_not_logged_in
    erb :'/tasks/new'
  end
end