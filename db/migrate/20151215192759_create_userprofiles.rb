class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :profile
      t.string :mail
      t.string :area

      t.timestamps null: false
    end
  end
end
