class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :artists, :awards do |t|
       t.index [:artist_id, :award_id]
       t.index [:award_id, :artist_id]
    end
  end
end
