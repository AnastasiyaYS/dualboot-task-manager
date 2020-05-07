# frozen_string_literal: true

class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
  end
end
