class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height
      t.string :password_digest
      t.timestamps null: false
      t.boolean :admin, :default => false
    end
  end 
end
