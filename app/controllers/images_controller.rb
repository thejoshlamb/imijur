class ImagesController < ApplicationController
  def index #accesses all Image objects
    @images  = Image.all
    @image = Image.new
    @most_recent_six = Image.most_recent_six
  end

  def new #instantiates a new Image object and displays the new image page
    @image = Image.new
  end

  def create # accepts params and saves to db

    @image = Image.new(image_params)

    if @image.save
      redirect_to images_url
    else
      render "new"
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit #shows the
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(image_params)
      redirect_to "/images/#{@image.id}"
    else
      render :edit
    end
  end


  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_url
  end

  def image_params
     params.require(:image).permit(:title, :author, :URL)
   end

end
