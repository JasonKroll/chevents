class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :yes_no, default: true
      t.string :default, default: "yes"

      t.timestamps
    end
  end
end
