require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome da app' do
    #Arrange (nesse caso pode ficar vazio, pois é o início)

    # Act
    visit('/')
    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end