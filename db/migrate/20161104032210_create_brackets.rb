class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|

      t.timestamps null: false
    end
  end
end
