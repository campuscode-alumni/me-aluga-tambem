require 'rails_helper'

feature 'User send a proposal' do
  scenario 'successfully' do

    user = User.create!(name: 'jose', email: 'jose@jose.com', password: '123456', phone: '12345678', document: '123')
    region = Region.create!(name: 'Copacabana')
    property_type = PropertyType.create!(name: 'Apartamento')
    realtor = Realtor.create(email: 'Joaquim@teste.com',
                            password: '1234567')
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

    visit root_path
    click_on 'Logar'

    fill_in 'Email', with: 'jose@jose.com'
    fill_in 'Senha', with: '123456'
    within 'form' do
      click_on 'Entrar'
    end

    click_on('Lindo Apartamento')
    click_on('Enviar proposta')
    
    fill_in 'Data de entrada', with: '10/12/2018'
    fill_in 'Data de saída', with: '20/12/2018'
    fill_in 'Motivo', with: 'Férias de fim de ano com a família'
    fill_in 'Quantidade de hóspedes', with: '8'
    
    click_on('Efetuar Proposta')

    expect(page).to have_content('Proposta enviada com sucesso')
    expect(page).to have_content('Valor total de 6000.0')
  end

  scenario 'and blank fields' do

    user = User.create!(name: 'jose', email: 'jose@jose.com', password: '123456', phone: '12345678', document: '123')
    region = Region.create!(name: 'Copacabana')
    property_type = PropertyType.create!(name: 'Apartamento')
    realtor = Realtor.create(email: 'Joaquim@teste.com',
                            password: '1234567')

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
                               realtor: realtor
                               )

    visit root_path
    click_on 'Logar'

    fill_in 'Email', with: 'jose@jose.com'
    fill_in 'Senha', with: '123456'
    within 'form' do
      click_on 'Entrar'
    end

    click_on('Lindo Apartamento')
    click_on('Enviar proposta')
    click_on('Efetuar Proposta')

    expect(page).to have_content('Preencha todos os campos')
  end

end