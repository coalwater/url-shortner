class AddReferrerToUrlHit < ActiveRecord::Migration
  def change
    add_column :url_hits, :referrer, :string
  end
end
