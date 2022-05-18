require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    context 'required attributes' do
      it 'false when name is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: '', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
    
      it 'false when sku is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: '', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when weight is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: '', width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when width is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: '', height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when height is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: '', depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when depth is empty' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: '',
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
    end

    context 'unique attributes' do
      it 'false when sku is already in use' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        first_pm = ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        second_pm = ProductModel.new(name: 'SoundBar 7.1 Surround', weight: 3000, width: 80, height: 15,
                                  depth: 20, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)

        # Act
        result = second_pm.valid?
        # Assert
        expect(result).to eq false
      end
    end

    context 'sku attribute has a length of 20 numeric digits' do
      it "true when it has 20 numeric digits" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq true
      end
      
      it "false when there is more character than necessary" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE1', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it "true when there is less character than necessary" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90CE', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq true
        end      
    end

    context 'minimum attribute value' do
      it "false when weight is equal to or less than 0" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        first_pm = ProductModel.new(name: 'TV 32', weight: 0, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE', supplier: supplier)
        second_pm = ProductModel.new(name: 'SoundBar 7.1 Surround', weight: -2, width: 80, height: 15,
                                  depth: 20, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        first_result = first_pm.valid?
        second_result = second_pm.valid?
        # Assert
        expect(first_result).to eq false
        expect(second_result).to eq false
      end

      it "false when width is equal to or less than 0" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        first_pm = ProductModel.new(name: 'TV 32', weight: 0, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE', supplier: supplier)
        second_pm = ProductModel.new(name: 'SoundBar 7.1 Surround', weight: -2, width: 80, height: 15,
                                  depth: 20, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        first_result = first_pm.valid?
        second_result = second_pm.valid?
        # Assert
        expect(first_result).to eq false
        expect(second_result).to eq false
      end

      it "false when height is equal to or less than 0" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        first_pm = ProductModel.new(name: 'TV 32', weight: 0, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE', supplier: supplier)
        second_pm = ProductModel.new(name: 'SoundBar 7.1 Surround', weight: -2, width: 80, height: 15,
                                  depth: 20, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        first_result = first_pm.valid?
        second_result = second_pm.valid?
        # Assert
        expect(first_result).to eq false
        expect(second_result).to eq false
      end

      it "false when depth is equal to or less than 0" do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'Samsung Eletronicos LTDA',
                                brand_name: 'Samsung', registration_number: '07317108000151',
                                full_address: 'Av Nacoes Unidas, 1000', city: 'São Paulo',
                                state: 'SP', email: 'sac@samsung.com.br',
                                phone_number: '1134962753')
        first_pm = ProductModel.new(name: 'TV 32', weight: 0, width: 70, height: 45, depth: 10,
                                  sku: 'TV32-SAMSU-XPTO90-CE', supplier: supplier)
        second_pm = ProductModel.new(name: 'SoundBar 7.1 Surround', weight: -2, width: 80, height: 15,
                                  depth: 20, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)
        # Act
        first_result = first_pm.valid?
        second_result = second_pm.valid?
        # Assert
        expect(first_result).to eq false
        expect(second_result).to eq false
      end      
      
    end  
  end
end
