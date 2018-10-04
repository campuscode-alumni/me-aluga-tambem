require 'rails_helper'

feature 'Realtor admin register Property Type' do
  scenario 'successfully' do

    realtor = Realtor.create(email: 'Joaquim@teste.com',
    password: '1234567')

    visit root_path
    click_on 'Login Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'

    click_on 'Cadastrar tipo de imóvel'
    fill_in 'Nome', with: 'Apartamento'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Tipo do imóvel cadastrado com sucesso')
    expect(page).to have_css('h1', text: 'Apartamento')
  end

  scenario 'and leave blank fields' do
    
    realtor = Realtor.create(email: 'Joaquim@teste.com',
    password: '1234567')

    visit root_path
    click_on 'Login Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'
    
    click_on 'Cadastrar tipo de imóvel'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
