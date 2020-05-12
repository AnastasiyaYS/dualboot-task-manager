# frozen_string_literal: true

class RemoveAuthorIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :author_id, :integer
  end
end
