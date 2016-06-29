class CreateEmailInfos < ActiveRecord::Migration
  def change
    create_table :email_infos do |t|
      t.string :email_id
      t.boolean :is_open
      t.boolean :is_click

      t.timestamps null: false
    end
  end
end
