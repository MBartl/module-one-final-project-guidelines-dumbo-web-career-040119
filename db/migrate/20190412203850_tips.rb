class Tips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :name
      t.string :category
      t.string :title
      t.string :content
      t.boolean :experience_level
    end
  end
end
