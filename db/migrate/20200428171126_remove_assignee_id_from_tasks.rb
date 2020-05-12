# frozen_string_literal: true

class RemoveAssigneeIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :assignee_id, :integer
  end
end
