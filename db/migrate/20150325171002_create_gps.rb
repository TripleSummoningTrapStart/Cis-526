class CreateGps < ActiveRecord::Migration
  def change
    create_table :gps do |t|

      t.timestamps
    end
  end
end
