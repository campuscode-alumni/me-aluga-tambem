require 'rails_helper'

feature 'realtor login' do
  scenario 'succesfully' do

    realtor = Realtor.create!(email: 'realtor@teste.com', password: '1234567')

    visit root_path

    click_on 'Logar como Corretor'

    expect(page).to have_content('h2', 'Área do Corretor' )
    fill_in 'Email', with: 'realtor@teste.com'
    fill_in 'Senha', with: '1234567'
    within 'form' do
      click_on 'Entrar'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')
  end

  scenario 'realtor login with bad credentials' do
    realtor = Realtor.create!(email: 'realtor@teste.com', password: '1234567')

    visit root_path

    click_on 'Logar como Corretor'

    fill_in 'Email', with: 'realtor'
    fill_in 'Senha', with: '123'
    within 'form' do
      click_on 'Entrar'
    end

    expect(page).to have_content('Invalid Email or password')
  end
end
