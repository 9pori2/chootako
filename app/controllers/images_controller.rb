class ImagesController < ApplicationController
  def register
    @image = Image.no_label.first
    if @image
      redirect_to edit_image_path(@image)
    else
      redirect_to root_url
    end
  end

  def search
    @images = Image.label_like(params[:query]).order_by_rate
    @params = params
    @images = @images.page params[:page]
    respond_to do |format|
      format.html do
        render action: "index"
      end
    end
  end

  def index
    @images = Image.where('true').page params[:page]
    @params = params
    respond_to do |format|
      format.html
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(user_params)
      redirect_to register_images_path
    else
      respond_to do |format|
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "removed"}
    end
  end

  def show_image
    @image = Image.find(params[:id])
    send_data @image.bin, type:'image/png',disposition:'inline',filename:@image.filename
  end

  def download_image
    @image = Image.find(params[:id])
    send_data @image.bin, type:'image/png',filename:@image.filename
  end

  private

  def user_params
    params.require(:image).permit(
      :label1,
      :label2,
      :label3,
      :rate
    )
  end

end
