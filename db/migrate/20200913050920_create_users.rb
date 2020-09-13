class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :picture_url
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
