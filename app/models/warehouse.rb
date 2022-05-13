class Warehouse < ApplicationRecord
  validates :name, :code, :city, :description, :address, :CEP, :area, presence: true
  validates :name, :code, uniqueness: true
  validates :CEP, format: { with: /\A\d{5}[-]\d{3}\Z/, message: "só é válido no formato: 00000-000" }
end
