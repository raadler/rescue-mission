class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.text :description, null: false
      
      t.timestamps
    end
  end
end
