class CreateCompletions < ActiveRecord::Migration[6.0]
  def change
    create_table :completions do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
