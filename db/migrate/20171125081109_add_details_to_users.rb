class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :question1, :integer
    add_column :users, :question2, :integer
    add_column :users, :question3, :integer
    add_column :users, :question4, :integer
    add_column :users, :question5, :integer
  end
end
