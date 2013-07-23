class AddColumnsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :title, :string
    add_column :documents, :tagline, :string
    add_column :documents, :author, :string
    add_column :documents, :university, :string
    add_column :documents, :class_code, :string
    add_column :documents, :class_name, :string
    add_column :documents, :department, :string
    add_column :documents, :professor, :string
    add_column :documents, :keywords, :text
  end
end
