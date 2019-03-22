class CreateVerificationSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :verification_sessions, id: :uuid do |t|
      t.string     :status
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
