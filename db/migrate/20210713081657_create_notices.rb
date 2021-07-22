class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end