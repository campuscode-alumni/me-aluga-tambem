require 'rails_helper'

feature 'Admin register Region' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar região'
    fill_in 'Nome', with: 'Copacabana'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Região cadastrada com sucesso')
    expect(page).to have_css('h1', text: 'Copacabana')
  end

  scenario 'and leave blank fields' do
    visit root_path
    click_on 'Cadastrar região'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
