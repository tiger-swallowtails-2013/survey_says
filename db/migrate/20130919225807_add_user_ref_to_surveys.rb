class AddUserRefToSurveys < ActiveRecord::Migration
  def up
    change_table :surveys do |t|
      t.references :user
    end
  end

  def down
    change_table :surveys do |t|
      t.remove :user_id
    end
  end
end
