class CreateIndex < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      add_index :users, :email, unique: true
      add_index :users, :remember_token
    end
  end
end
