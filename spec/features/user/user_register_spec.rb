require 'rails_helper'

  feature 'User register account' do
    scenario 'successfully' do 

      visit root_path
      click_on 'Cadastrar usuario'
      fill_in 'Nome', with: 'José'
      fill_in 'Email', with: 'jose@email.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      fill_in 'Documento', with: '123'
      fill_in 'Telefone', with: '123'
      click_on 'Cadastrar'

      user = User.last
      expect(user.name).to eq('José')
      expect(user.email).to eq('jose@email.com')
      expect(user.document).to eq('123')
      expect(user.phone).to eq(123)

      expect(page).to have_content('You have signed up successfully')
    end
  
  end
