class DogsController < ApplicationController
  def index
  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = params[:user_id]
      if @dog.save
        flash[:success] = "Adding Your Dog Successful!"
        redirect_to user_dog_path(params[:user_id], @dog.id)
      else
        render 'new'
      end
  end


  def edit
  end

  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :weight, :age, :color, :gender, :city, :personality)
    end

end
