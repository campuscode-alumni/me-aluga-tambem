class UnavailableRangesController < ApplicationController

    def new
      @unavailable_range = UnavailableRange.new
      @property = Property.find(params[:property_id])
    end

    def create
      @property = Property.find(params[:property_id])
      @unavailable_range = @property.unavailable_ranges.new(unavailable_range_params)

      if @unavailable_range.save
        flash[:success] = "Restrição de data adicionada com Sucesso"
        redirect_to @property
      else
        flash[:alert] = "Certifique-se de preencher os dados corretamente"
        render :new
      end

    end

    def unavailable_range_params
      params.require(:unavailable_range).permit(:start_date, :end_date, :description)
    end

end