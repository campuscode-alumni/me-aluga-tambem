require 'rails_helper'

feature 'Realtor register unavailable ranges' do 

  scenario 'successfully' do
        
    realtor = Realtor.create(email: 'Joaquim@teste.com',
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
    
    visit root_path
    click_on 'Logar como Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'

    click_on 'Lindo Apartamento'
    click_on 'Adicionar restrição de Datas'

    fill_in 'Data Inicial', with: '10/05/2018'
    fill_in 'Data Final', with: '20/05/2018' 
    fill_in 'Descrição', with: 'Reforma'

    click_on 'Adicionar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Data(s) com Restrição')
    expect(page).to have_css('li', text: 'Data Inicial: 10/05/2018')
    expect(page).to have_css('li', text: 'Data Final: 20/05/2018')
    expect(page).to have_css('li', text: 'Descrição: Reforma')
  end

  scenario 'and blank fields' do
    realtor = Realtor.create(email: 'Joaquim@teste.com',
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
    
    visit root_path
    click_on 'Logar como Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'

    click_on 'Lindo Apartamento'
    click_on 'Adicionar restrição de Datas'

    fill_in 'Data Inicial', with: ''
    fill_in 'Data Final', with: '' 
    fill_in 'Descrição', with: ''

    click_on 'Adicionar'

    expect(page).to have_content('Certifique-se de preencher os dados corretamente')
  end

end