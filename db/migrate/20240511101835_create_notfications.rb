class CreateNotfications < ActiveRecord::Migration[7.1]
  def change
    create_table :notfications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :website, null: false, foreign_key: true
      t.integer :duration
      t.string :message

      t.timestamps
    end
  end
end
