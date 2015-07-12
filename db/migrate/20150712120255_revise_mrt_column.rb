class ReviseMrtColumn < ActiveRecord::Migration
  def change
  	change_column :mrts, :latitude, :float
  	change_column :mrts, :longitude, :float
  end
end
