class CreateUrlHits < ActiveRecord::Migration
  def change
    create_table :url_hits do |t|
      t.integer :url_id

      t.timestamps null: false
    end
  end
end
