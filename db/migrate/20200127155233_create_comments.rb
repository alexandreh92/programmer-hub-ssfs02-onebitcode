# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def self.up
    create_table :comments do |t|
      t.string :title, limit: 50, default: ''
      t.text :comment
      t.references :commentable, polymorphic: true
      t.references :user, foreign_key: true
      t.string :role, default: 'comments'
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end

  def self.down
    drop_table :comments
  end
end
