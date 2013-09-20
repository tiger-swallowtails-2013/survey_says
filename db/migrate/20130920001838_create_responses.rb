class CreateResponses < ActiveRecord::Migration
  def up
    create_table :responses do |t|
      t.references :question
      t.text :response_text

      t.timestamps
    end
  end

  def down
    drop_table :responses
  end
end
