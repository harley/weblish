class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :file
      t.integer :user_id

      t.timestamps
    end

    add_index :documents, [:user_id, :created_at]
  end
end
