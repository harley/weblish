class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user, index: true
      t.references :topic, index: true

      t.timestamps
    end
    add_index :interests, [:user_id, :topic_id]
    add_index :interests, [:topic_id, :user_id]
  end
end
