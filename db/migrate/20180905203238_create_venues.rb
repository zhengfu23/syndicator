class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :venue_type
      t.string :organizer_id

      t.timestamps
    end
  end
end
