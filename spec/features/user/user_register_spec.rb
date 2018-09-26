require 'rails_helper'

  feature 'User register account' do
    scenario 'successfully' do 

      visit root_path
      click_on 'Cadastrar usuario'
      fill_in 'Nome', with: 'José'
      fill_in 'Email', with: 'Jose@email.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      fill_in 'Documento', with: '123'
      fill_in 'Telefone', with: '123'
      click_on 'Cadastrar'

      # expect(page).to have_css('div.alert.alert-success', text: 'Seu cadastro foi efetuado com sucesso')
      expect(page).to have_content('oskopaske')

    end
  
  end
