class RemoveValueColumnFromShortUrls < ActiveRecord::Migration
  def change
    remove_column :short_urls, :value
  end
end
