class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image_url
      t.integer :old
      t.string :university
      t.string :job1
      t.string :job2
      t.string :job3
      t.integer :result_id

      t.timestamps
    end
  end
end
