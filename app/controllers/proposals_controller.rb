class ProposalsController   < ApplicationController

  def new
    @proposal = Proposal.new
    @property = Property.find(params[:property_id])
  end 

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.new(proposal_params)
    @proposal.user = current_user
    @proposal.set_total_amount

    if @proposal.save
      flash[:success] = 'Proposta enviada com sucesso'
      redirect_to [@proposal.property, @proposal]
    else
      flash[:alert] = 'Preencha todos os campos'
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def index
    @proposals = Proposal.where(property: current_realtor.properties)
  end

  def approve
    @proposal = Proposal.find(params[:id])
    @proposal.status_changed_at = Time.now
    @proposal.approved!
    
    redirect_to [@proposal.property, @proposal]
  end

  def proposal_params
    params.require(:proposal).permit(:start_date, :end_date, :rent_proposal, :total_guests )
  end  
end    