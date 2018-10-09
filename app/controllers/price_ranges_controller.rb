class PriceRangesController < ApplicationController
  def new
    @price = PriceRange.new()
    @property = Property.find(params[:property_id])
  end

  def create
    @price = PriceRange.new(params.require(:price_range).permit(:description, :start_date, :end_date, :daily_rate))
    @property = Property.find(params[:property_id])
    @price.property = @property

    if @price.save!
      flash[:success] = 'Preço inserido com sucesso!'
        redirect_to @property
      else
        flash[:alert] = 'Você deve preencher todos os campos'
        render :new
      end    
  end

end
