class DogsController < ApplicationController
  def index

  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
    @user = User.find(params[:user_id])
    @photo = Photo.where(dog_id: params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @dog = @user.dogs.create(dog_params)
    # @dog = Dog.new(dog_params)
    # @dog.user_id = params[:user_id]
      if @dog.save
        flash[:success] = "Adding Your Dog Successful!"
        redirect_to user_dog_path(@user, @dog)
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
