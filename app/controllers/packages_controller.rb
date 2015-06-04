class PackagesController < ApplicationController
  def index
    @packages = current_user.packages.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new
    @package.carrier = params[:carrier]
    @package.user_id = current_user.id
    @package.tracking_number = params[:tracking_number]

    if @package.save
      redirect_to "/packages", :notice => "Package created successfully."
    else
      render 'new'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])

    @package.carrier = params[:carrier]
    @package.user_id = current_user.id
    @package.tracking_number = params[:tracking_number]

    if @package.save
      redirect_to "/packages", :notice => "Package updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])

    @package.destroy

    redirect_to "/packages", :notice => "Package deleted."
  end
end
