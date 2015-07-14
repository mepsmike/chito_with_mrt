class CreateMrtStations < ActiveRecord::Migration
  def change
    create_table :mrt_stations do |t|

      t.timestamps null: false
      t.string :name
      t.string :line
      t.text :address
      t.float :latitude
      t.float :longitude
    end
  end
end
