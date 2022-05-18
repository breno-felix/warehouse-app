require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    # Arrange
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
    other_supplier = Supplier.create!(corporate_name: 'LG do Brasil LTDA',
                                brand_name: 'LG', registration_number: '34356508000149',
                                full_address: 'Av Ibirapuera, 300', city: 'São Paulo',
                                state: 'SP', email: 'contato@lg.com.br',
                                phone_number: '1132325008')                            
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo Modelo de Produto'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: '90'
    fill_in 'Profundidade', with: '10'
    fill_in 'SKU', with: 'TV40-SAMS-XPTO'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'
    # Assert
    expect(current_path).to eq product_model_path(ProductModel.find_by(name: 'TV 40 polegadas'))
    expect(page).to have_content('Modelo de produto cadastrado com sucesso')
    expect(page).to have_content('Fornecedor: Samsung')
    expect(page).to have_content('SKU: TV40-SAMS-XPTO')
    expect(page).to have_content('Dimensão: 60cm x 90cm x 10cm')
    expect(page).to have_content('Peso: 10000')    
  end

  it 'com dado incompletos' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
    #Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo Modelo de Produto'
    fill_in 'Nome', with: ''
    fill_in 'Peso', with: ''
    fill_in 'Altura', with: ''
    fill_in 'Largura', with: ''
    fill_in 'Profundidade', with: ''
    fill_in 'SKU', with: ''
    click_on 'Enviar'
    #Assert
    expect(page).to have_content 'Não foi possível cadastrar o modelo de produto.'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Peso não pode ficar em branco'
    expect(page).to have_content 'Altura não pode ficar em branco'
    expect(page).to have_content 'Largura não pode ficar em branco'
    expect(page).to have_content 'Profundidade não pode ficar em branco'
    expect(page).to have_content 'SKU não pode ficar em branco'
  end
end