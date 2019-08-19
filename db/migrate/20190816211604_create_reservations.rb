class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :id_reservation
      t.string :identification
      t.string :email
      t.string :name_user
      t.string :number_phone

      t.timestamps
    end
  end
end
