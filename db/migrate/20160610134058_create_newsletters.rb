class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.datetime :delivered_at
      t.string :subject

      t.timestamps null: false
    end
  end
end
