require 'rails_helper'

describe 'Usuário edita um galpão' do
  it 'a partir da página de detalhes' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                     registration_number: '43447216000102', full_address: 'Av das Palmas, 100',
                     city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                     phone_number: '1134963861')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    # Assert
    expect(page).to have_content('Editar Fornecedor')
    expect(page).to have_field('Nome Fantasia', with: 'ACME')
    expect(page).to have_field('Razão Social', with: 'ACME LTDA')
    expect(page).to have_field('CNPJ', with: '43447216000102')
    expect(page).to have_field('Endereço', with: 'Av das Palmas, 100')
    expect(page).to have_field('Cidade', with: 'Bauru')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('E-mail', with: 'contato@acme.com')
    expect(page).to have_field('Telefone', with: '1134963861')
  end

  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                     registration_number: '43447216000102', full_address: 'Av das Palmas, 100',
                     city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                     phone_number: '1134963861')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: 'Spark'
    fill_in 'Razão Social', with: 'Spark Industries Brasil LTDA'
    fill_in 'CNPJ', with: '16074559000104'
    fill_in 'Endereço', with: 'Torre da Indústria, 1'
    fill_in 'Cidade', with: 'Teresina'
    fill_in 'Estado', with: 'PI'
    fill_in 'E-mail', with: 'vendas@spark.com.br'
    fill_in 'Telefone', with: '8632251982'
    
    click_on 'Enviar'
    
    # Assert
    expect(current_path).to eq supplier_path(Supplier.find_by(brand_name: 'Spark'))
    expect(page).to have_content('Fornecedor atualizado com sucesso')
    expect(page).to have_content('Fornecedor Spark')
    expect(page).to have_content('Spark Industries Brasil LTDA')
    expect(page).to have_content('Documento: 16074559000104')
    expect(page).to have_content('Endereço: Torre da Indústria, 1 - Teresina - PI')
    expect(page).to have_content('E-mail: vendas@spark.com.br')
    expect(page).to have_content('Telefone: 8632251982')
  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                     registration_number: '43447216000102', full_address: 'Av das Palmas, 100',
                     city: 'Bauru', state: 'SP', email: 'contato@acme.com',
                     phone_number: '1134963861')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Razão Social', with: ''
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'
    
    # Assert
    expect(page).to have_content('Não foi possível atualizar o galpão')
    expect(page).to have_content('Nome Fantasia não pode ficar em branco')
    expect(page).to have_content('Razão Social não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('E-mail não pode ficar em branco')

  end
end