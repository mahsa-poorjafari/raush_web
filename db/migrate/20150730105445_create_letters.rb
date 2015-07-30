class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :letter_number
      t.string :peyvast
      t.string :reciever_name
      t.string :reciever_post
      t.string :letter_subject
      t.text :text
      t.string :sign_thanks
      t.string :sign_post
      t.text :runevesht
      t.text :description

      t.timestamps
    end
  end
end
