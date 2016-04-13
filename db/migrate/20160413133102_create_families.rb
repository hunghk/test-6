class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.references :person, index: true, foreign_key: true
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
