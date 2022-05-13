require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #comentei para entender melhor depois
  #se tiver testanto um metodo de instância usa-se # se estiver testando um método de classe usa-se .
  describe '#valid?' do
    context 'required attributes' do
      it 'false when name is empty' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço', CEP: '25000-000',
                                  city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when code is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Endereço', CEP: '25000-000',
                                  city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '', CEP: '25000-000',
                                  city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when CEP is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '',
                                  city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '25000-000',
                                  city: '', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when area is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '25000-000',
                                  city: 'Rio', area: '', description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when description is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '25000-000',
                                  city: 'Rio', area: 1000, description: '')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
    end
    context 'unique attributes' do
      it 'false when code is already in use' do
        # Arrange
        first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço',
                                        CEP: '25000-000', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')
  
        second_warehouse = Warehouse.new(name: 'Niteroi', code: 'RIO', address: 'Avenida',
                                         CEP: '35000-000', city: 'Niteroi', area: 1500,
                                         description: 'Outra descrição')
        # Act
        result = second_warehouse.valid?
        # Assert
        expect(result).to eq false
      end
  
      it 'false when name is already in use' do
        # Arrange
        first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço',
                                        CEP: '25000-000', city: 'Rio', area: 1000,
                                        description: 'Alguma descrição')
  
        second_warehouse = Warehouse.new(name: 'Rio', code: 'NIT', address: 'Avenida',
                                         CEP: '35000-000', city: 'Niteroi', area: 1500,
                                         description: 'Outra descrição')
        # Act
        result = second_warehouse.valid?
        # Assert
        expect(result).to eq false
      end
    end
    context 'zipcode attribute format is 00000-000' do
      it 'false when forget character -' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '000000000',
        city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it "true when character - is in the correct position" do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '00000-000',
        city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq true
      end

      it "false when there is more character than necessary" do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '0000000000',
        city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it "false when there is less character than necessary" do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', CEP: '00000000',
        city: 'Rio', area: 1000, description: 'Alguma descrição')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

    end
  end
end
