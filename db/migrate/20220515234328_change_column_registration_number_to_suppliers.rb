class ChangeColumnRegistrationNumberToSuppliers < ActiveRecord::Migration[7.0]
  def change
    change_column :suppliers, :registration_number, :string
  end
end
