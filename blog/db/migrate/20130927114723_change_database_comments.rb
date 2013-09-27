class ChangeDatabaseComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :Comment
      t.string :commenter
    end
  end
end
