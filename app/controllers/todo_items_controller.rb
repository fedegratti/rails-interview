class TodoItemsController < ApplicationController
  include TodoItemActions

  before_action :set_todo_list, only: %i[ new create index ]
  before_action :set_todo_item, only: %i[ edit update destroy ]

  # GET /todolists/:id/todos
  def index
    @todo_items = @todo_list.todo_items
  end

  # GET /todolists/:id/todos/new
  def new
    @todo_item = TodoItem.new
    
    respond_to :html
  end

  # GET /todolists/:id/todos/edit
  def edit
  end

  # POST /todolists/:id/todos
  def create
    if create_todo_item
      redirect_to todo_list_todos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PUT /todolists/:id/todos/:todo_item_id
  def update
    if update_todo_item
      redirect_to todo_list_todos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /todolists/:id/todos/:todo_item_id
  def destroy
    destroy_todo_item!
    redirect_to todo_list_todos_path
  end
end