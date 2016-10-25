class CreateCodeposts < ActiveRecord::Migration[5.0]
  def change
    create_table :codeposts do |t|
      t.string :title
      t.text :html
      t.text :css
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :codeposts, [:user_id, :created_at]
  end
end
