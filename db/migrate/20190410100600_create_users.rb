class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string:name
      t.string:email
      t.string :password_digest
      t.text :prof_image
      t.text :prof_content
      t.timestamps
    end
  end
end
