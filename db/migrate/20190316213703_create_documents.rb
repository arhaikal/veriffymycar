class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :number
      t.string :type
      t.string :country
      t.date :valid_from
      t.date :valid_until
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
