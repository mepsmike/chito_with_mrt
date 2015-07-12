class CreateMrts < ActiveRecord::Migration
  def change
    create_table :mrts do |t|

      t.timestamps null: false
      t.string :name
      t.integer :number
      t.text :address
      t.string :latitude
      t.string :longitude
    end
  end
end
