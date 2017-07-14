class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false, uniqueness: true
      t.string :short_url, null: false, uniqueness: true
      t.integer :user_id, null: false
    end
  end
end
