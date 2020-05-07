# frozen_string_literal: true

class AddForeignKeyToTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :users, column: :author_id, primary_key: 'id'
    add_foreign_key :tasks, :users, column: :assignee_id, primary_key: 'id'
  end
end
