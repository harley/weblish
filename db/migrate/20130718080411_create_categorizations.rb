class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations, id: false, force: true do |t|
      t.integer :document_id
      t.integer :topic_id
    end
    add_index :categorizations, [:document_id, :topic_id]
    add_index :categorizations, [:topic_id, :document_id]
  end
end
