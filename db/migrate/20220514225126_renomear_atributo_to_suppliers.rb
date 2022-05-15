class RenomearAtributoToSuppliers < ActiveRecord::Migration[7.0]
  def change
    rename_column :suppliers, :corporete_name, :corporate_name
  end
end
