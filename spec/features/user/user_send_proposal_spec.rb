require 'rails_helper'

feature 'User send a proposal' do
  scenario 'successfully' do
    region = Region.create!(name: 'Copacabana')
    property_type = PropertyType.create!(name: 'Apartamento')

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
                               daily_rate: 600.00
                               )

    visit root_path

    click_on('Lindo Apartamento')
    click_on('Enviar proposta')
    
    fill_in 'Data de entrada ', with: '15/12/2018'
    fill_in 'Data de saída', with: '15/01/2019'
    fill_in 'Motivo', with: 'Férias de fim de ano com a família'
    fill_in 'Quantidade de hóspedes', with: '8'

    click_on('Efetuar Proposta')

    expect(page).to have_content('Proposta enviada com sucesso')
  end
end