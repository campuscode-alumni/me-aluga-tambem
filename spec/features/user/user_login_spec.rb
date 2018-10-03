require 'rails_helper'

feature 'user login' do

  scenario 'successfully' do

    user = User.create!(name: 'jose', email: 'jose@jose.com', password: '123456', phone: '12345678', document: '123')
    visit root_path
    click_on 'Logar'

    fill_in 'Email', with: 'jose@jose.com'
    fill_in 'Senha', with: '123456'
    within 'form' do
      click_on 'Entrar'
    end

    expect(current_path).to eq(root_path)

  end
  scenario 'And wrong credentials' do

    user = User.create!(name: 'jose', email: 'jose@jose.com', password: '123456', phone: '12345678', document: '123')
    visit root_path
    click_on 'Logar'

    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    within 'form' do
      click_on 'Entrar'
    end

    expect(page).to have_content('Invalid Email or password')

  end


end