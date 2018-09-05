class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.string :start_timezone
      t.datetime :end_time
      t.string :end_timezone
      t.string :currency

      t.timestamps
    end
  end
end
