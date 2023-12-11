class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: {unique: true}
      t.integer :number
      t.text :address



      t.timestamps
    end
  end
end
