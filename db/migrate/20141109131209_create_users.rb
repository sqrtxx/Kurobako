class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :full_name
      t.string :email
      t.string :description
      t.text :url

      t.timestamps
    end
  end
end
