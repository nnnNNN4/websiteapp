class CreateBrowsingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :browsing_histories do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      
      t.timestamps
    end
  end
end
