class AddSlugColumnToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :slug, :string
  end
end
