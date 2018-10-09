require 'rails_helper'

feature 'Realtor approve proposals' do
  scenario 'successfully' do              
    realtor = Realtor.create!(email: 'Joaquim@teste.com',
                             password: '1234567')

    property_type = PropertyType.create!(name: 'casa')
    region = Region.create!(name: 'Florianópolis')
    property = Property.create!(title: 'Lindo Apartamento',
                                description: 'Lindo apartamento em Copacabana de frente para o mar',
                                property_type: property_type,
                                region: region,
                                rent_purpose: 'Aluguel para temporadas',
                                area: 120,
                                room_quantity: 4,
                                accessibility: true,
                                allow_pets: true,
                                allow_smokers: false,
                                maximum_guests: 16,
                                minimum_rent: 1,
                                maximum_rent: 10,
                                maximum_guests: 364,
                                daily_rate: 600.00,
                                realtor: realtor)
                              
    user = User.create!(name: 'Joao',
                        email: 'joao@mailme.com',
                        password: '1233556',
                        document: '12345678901',
                        phone: '33038003')

    proposal = Proposal.create!(start_date: '20/12/2018',
                                end_date: '15/01/2019',
                                total_guests: 5,
                                rent_proposal: 'ferias',
                                property: property,
                                user: user)
                            
    visit root_path
    click_on 'Logar como Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'
    click_on 'Ver Propostas'
    click_on 'Lindo Apartamento'
    click_on 'Aceitar'

    expect(page).to have_css('h1', text: 'Dados da Proposta')
    expect(page).to have_css('h2', text: proposal.property.title)
    expect(page).to have_css('li', text: 'approved')
    expect(page).to have_css('li', text: proposal.start_date.strftime('%d/%m/%Y'))
    expect(page).to have_css('li', text: proposal.end_date.strftime('%d/%m/%Y'))
    expect(page).to have_css('li', text: proposal.total_guests)
    expect(page).to have_css('li', text: proposal.rent_proposal)
    expect(page).to have_css('li', text: proposal.total_amount)
    expect(page).to have_css('h1', text: 'Dados do Cliente')
    expect(page).to have_css('li', text: proposal.user.name)
    expect(page).to have_css('li', text: proposal.user.email)
    expect(page).to have_css('li', text: proposal.user.phone)
    expect(page).not_to have_content('Aceitar')
    expect(page).not_to have_content('Recusar')




  end
end  