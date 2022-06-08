class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :all_day, null: false, default: false
      t.string :content

      t.timestamps
    end
  end
end
