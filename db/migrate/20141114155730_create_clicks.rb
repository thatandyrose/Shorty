class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.belongs_to :short_url, index: true
      t.text :request

      t.timestamps
    end
  end
end
