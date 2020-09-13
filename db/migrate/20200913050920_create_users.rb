class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :picture_url

      t.timestamps
    end
  end
end
