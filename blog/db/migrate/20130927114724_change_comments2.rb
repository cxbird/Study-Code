class ChangeComments2 < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :Comment
    end
  end
end
