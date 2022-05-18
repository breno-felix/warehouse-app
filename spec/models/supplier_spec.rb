require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'required attributes' do
      it 'false when corporate_name is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: '', brand_name: 'ACME', 
                                registration_number: '43447216000102',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    
      it 'false when brand_name is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: '', 
                                registration_number: '43447216000102',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    
      it 'false when registration_number is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: '',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    
      it 'false when email is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: '43447216000102',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: '',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    end
    context 'unique attributes' do
      it 'false when registration_number is already in use' do
        # Arrange
        first_supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                          registration_number: '43447216000102',
                                          full_address: 'Av das Palmas, 100', city: 'Bauru',
                                          state: 'SP', email: 'contato@acme.com',
                                          phone_number: '1134963861')
        
        second_supplier = Supplier.new(corporate_name: 'Spark Industries Brasil LTDA',
                                       brand_name: 'Spark', registration_number: '43447216000102',
                                       full_address: 'Torre da Indústria, 1', city: 'Teresina',
                                       state: 'PI', email: 'vendas@spark.com.br',
                                       phone_number: '8632251982')
        # Act
        result = second_supplier.valid?
        # Assert
        expect(result).to eq false
      end
    end
    context 'registration_number attribute has a length of 14 numeric digits' do
      it "true when it has 14 numeric digits" do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: '03447216000102',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
      
      it "false when there is more character than necessary" do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: '434472160001029',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it "false when there is less character than necessary" do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: '3447216000102',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end

      it "false when not just numeric digits" do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: 'K344721B00010L',
                                full_address: 'Av das Palmas, 100', city: 'Bauru',
                                state: 'SP', email: 'contato@acme.com',
                                phone_number: '1134963861')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    end  
  end
end
