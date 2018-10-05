require 'rails_helper'

feature 'realtor_register_price_ranger' do
  scenario 'successfully' do
    
    realtor = Realtor.create!(email: 'realtor@teste.com', password: '12345678')
    property_type = PropertyType.create!(name: 'Apartamento')
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
                               daily_rate: 300.00,
                               realtor: realtor)
    
    visit root_path

    click_on 'Logar como Corretor'

    fill_in 'Email', with: 'realtor@teste.com'
    fill_in 'Senha', with: '12345678'
    within 'form' do
      click_on 'Entrar'
    end
   
    click_on 'Lindo Apartamento'
    click_on 'Cadastrar Preço por temporada'
    fill_in 'Temporada', with: 'Carnaval'
    fill_in 'Preço/Temporada', with: '650'
    fill_in 'Início da Temporada', with: '01/02/2019'
    fill_in 'Término da Temporada', with: '20/02/2019'
    click_on 'Inserir preço'

    expect(page).to have_css('success', text: 'Preço inserido com sucesso!')
    expect(page).to have_css('h1', text: 'Lindo apartamento')
    expect(page).to have_css('p', text: 'Lindo apartamento em Copacabana de frente para o mar')
    expect(page).to have_css('li', text: region.name)
    expect(page).to have_css('li', text: property_type.name)
    expect(page).to have_css('li', text: 'Aluguel para temporadas')
    expect(page).to have_css('li', text: '120')
    expect(page).to have_css('li', text: '4')
    expect(page).to have_css('li', text: 'Possui acessibilidade: Sim')
    expect(page).to have_css('li', text: 'Aceita animais: Sim')
    expect(page).to have_css('li', text: 'Aceita fumantes: Não')
    expect(page).to have_css('li', text: '16')
    expect(page).to have_css('li', text: '1')
    expect(page).to have_css('li', text: '10')
    expect(page).to have_css('li', text: 'Preço: 500')
    expect(page).to have_css('h3', text: 'Preços por Temporada')
    within('div.price_range') do
      expect(page).to have_content('Carnaval')
      expect(page).to have_content('01/02/2019')
      expect(page).to have_content('20/02/2019')
      expect(page).to have_content('R$ 650,00')
    end
    
  end
end
