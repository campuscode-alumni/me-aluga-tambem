class ProposalsController   < ApplicationController

  def new
    @proposal = Proposal.new
    @property = Property.find(params[:property_id])
  end 

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.new(proposal_params)
    @proposal_exist = @property.proposals.where(user: current_user ).exists?
    if @proposal_exist
      flash[:alert] = 'Proposta já cadastrada'
      return render :new
    end  
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

  def proposal_params
    params.require(:proposal).permit(:start_date, :end_date, :rent_proposal, :total_guests )
  end  
end    