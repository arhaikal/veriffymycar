class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.attachment :face
      t.attachment :document_front
      t.attachment :document_back
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
