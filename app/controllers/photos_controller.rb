class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:user_id])
    @dog = Dog.find(params[:dog_id])
    @photo = Photo.find(params[:id])
  end

  def create
    uploaded_file = params[:photo][:cloud_id].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)




    @user = User.find(params[:user_id])
    @dog = Dog.find(params[:dog_id])

    @photo = @dog.photos.create(cloud_id: cloudinary_file["public_id"])



      if @photo.save
        flash[:success] = "Adding Your Photo Successful!"
        redirect_to user_dog_photo_path(@user, @dog, @photo)
      else
        render 'new'
      end
  end


  def edit
  end


end
