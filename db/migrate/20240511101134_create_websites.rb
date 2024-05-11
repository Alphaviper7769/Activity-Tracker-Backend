class CreateWebsites < ActiveRecord::Migration[7.1]
  def change
    create_table :websites do |t|
      t.string :url
      t.string :category

      t.timestamps
    end
  end
end
