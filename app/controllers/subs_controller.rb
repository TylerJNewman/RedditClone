class SubsController < ApplicationController
  def index
    render :index
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
    @sub = Sub.find_by(params[:id])
  end

  def update
    @sub = Sub.new(sub_params)
    if @sub.save!
      redirect_to sub_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit_sub
    end
  end






  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
