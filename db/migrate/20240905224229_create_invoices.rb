class CreateInvoices < ActiveRecord::Migration[7.2]
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.decimal :total

      t.timestamps
    end
  end
end
