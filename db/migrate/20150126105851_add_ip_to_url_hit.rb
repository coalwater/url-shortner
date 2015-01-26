class AddIpToUrlHit < ActiveRecord::Migration
  def change
    add_column :url_hits, :ip, :string
  end
end
