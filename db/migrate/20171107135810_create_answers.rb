class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :response
      t.integer :votes, default: 0
      t.boolean :confirmed, nulable: true
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
