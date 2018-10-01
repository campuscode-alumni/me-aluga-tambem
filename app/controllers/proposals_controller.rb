class ProposalsController   < ApplicationController

  def new
    @proposal = Proposal.new
    @property = Property.find(params[:property_id])
  end 

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.property = Property.find(params[:property_id])
    if @proposal.save
      flash[:success] = 'Proposta enviada com sucesso'
      redirect_to [@proposal.property, @proposal]
    else
      flash[:alert] = 'Preencha todos os campos'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end


  def proposal_params
    params.require(:proposal).permit(:start_date, :end_date, :rent_proposal, :total_guests )
  end  
end    