class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :social_profile
      t.string :webpage

      t.timestamps
    end
  end
end
