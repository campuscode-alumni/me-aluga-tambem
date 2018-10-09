require 'rails_helper'

feature 'Realtor register Region' do
  scenario 'successfully' do
    
    realtor = Realtor.create(email: 'Joaquim@teste.com',
    password: '1234567')
    
    visit root_path
    click_on 'Logar como Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'
    click_on 'Cadastrar região'
    fill_in 'Nome', with: 'Copacabana'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Região cadastrada com sucesso')
    expect(page).to have_css('h1', text: 'Copacabana')
  end

  scenario 'and leave blank fields' do
    realtor = Realtor.create(email: 'Joaquim@teste.com',
    password: '1234567')
    
    visit root_path
    click_on 'Logar como Corretor'
    fill_in 'Email', with: 'Joaquim@teste.com'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'
    click_on 'Cadastrar região'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
