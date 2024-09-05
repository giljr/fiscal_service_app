# app/models/invoice.rb
class Invoice < ApplicationRecord
  validates :number, presence: true
  validates :date, presence: true
  validates :total, presence: true, numericality: true
end
