class ImagesController < ApplicationController
  def index #accesses all Image objects
    @images  = Image.all
  end

  def new #instantiates a new Image object and displays the new image page
    @image = Image.new
  end

  def create # accepts params and saves to db

    @image = Image.new(image_params)
    
    @image.title = params[:image][:title]
    @image.author = params[:image][:author]
    @image.URL = params[:image][:URL]

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
      redirect_to "/image/#{@image.id}"
    else
      render :edit
    end
  end


  def destroy
  end

  def image_params
     params.require(:image).permit(:title, :author, :url)
   end

end
