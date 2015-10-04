class BusinessesController < ApplicationController

  def index
    @biz = current_user.businesses
  end

  def show
    @biz = get_biz
    authorize @biz
  end

  def update
    @biz = get_biz
    authorize @biz
  end

  private

  def params_biz
    params.require(:business).permit(:name, :phone, :store_num)
  end

  def get_biz
    Business.find(params[:id])
  end
end
