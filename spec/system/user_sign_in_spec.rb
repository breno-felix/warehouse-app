# require 'rails_helper'

# describe 'Usuário se autentica' do
#   it 'com sucesso' do
#     # Arrange
#     User.create!(email: 'breno@email.com', password: 'password')
#     # Act
#     visit root_path
#     click_on 'Entrar'
#     fill_in 'E-mail', with: 'breno@email.com'
#     fill_in 'Password', with: 'password'
#     click_on 'Entrar'
#     # Assert
#     expect(page).not_to have_link('Entrar')
#     expect(page).to have_link('Sair')
#     within('nav') do
#       expect(page).to have_content('breno@email.com')
#     end
#     #
#   end
# end