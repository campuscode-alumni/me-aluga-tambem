require 'rails_helper'

feature 'Admin register Property Type' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar tipo de imóvel'
    fill_in 'Nome', with: 'Apartamento'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Tipo do imóvel cadastrado com sucesso')
    expect(page).to have_css('h1', text: 'Apartamento')
  end

  scenario 'and leave blank fields' do
    visit root_path
    click_on 'Cadastrar tipo de imóvel'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
