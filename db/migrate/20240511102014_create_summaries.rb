class CreateSummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :summaries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :website, null: false, foreign_key: true
      t.datetime :Notiftime

      t.timestamps
    end
  end
end
