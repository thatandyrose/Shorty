class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :source_url
      t.string :value

      t.timestamps
    end
  end
end
