class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.boolean :available, :default => false

      t.timestamps

      t.belongs_to :user, index:true
    end
  end
end
