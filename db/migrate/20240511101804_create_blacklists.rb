class CreateBlacklists < ActiveRecord::Migration[7.1]
  def change
    create_table :blacklists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :website, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
