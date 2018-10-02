require 'rails_helper'

feature 'Realtor view proposals' do
  scenario 'successfully' do              
    realtor = Realtor.create!(email: 'Joaquim@teste.com',
                             password: '1234567')

    property_type = PropertyType.create!(name: 'casa')
    region = Region.create!(name: 'Florianópolis')
    property = Property.create!(title: 'Casa de banho', 
                              description: 'Lugar maravilho para tomar banho',
                              maximum_guests: 5,
                              property_type: property_type,
                              region: region,
                              room_quantity: 2,
                              minimum_rent: 2,
                              maximum_rent: 10,
                              daily_rate: 199.99,
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
                               user: user)
                            
    visit root_path
    click_on 'Login Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'
    click_on 'Ver Propostas'
    
    expect(page).to have_css('li', text: proposal.start_date)
    expect(page).to have_css('li', text: proposal.end_date)
    expect(page).to have_css('li', text: proposal.total_guests)
    expect(page).to have_css('li', text: proposal.rent_proposal)
    expect(page).to have_css('li', text: proposal.user)
                  
  end
end