# frozen_string_literal: true

class AddUserToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :author
    add_reference :tasks, :assignee
  end
end
