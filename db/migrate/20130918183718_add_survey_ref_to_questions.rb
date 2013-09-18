class AddSurveyRefToQuestions < ActiveRecord::Migration
  def up
    change_table :questions do |t|
      t.references :survey
    end
  end

  def down
    change_table :questions do |t|
      t.remove :client_id
    end
  end
end
