class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :question
      t.timestamps
    end

  end

  def down
    drop_table :questions
  end
end
