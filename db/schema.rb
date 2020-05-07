# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_200_504_112_110) do
  enable_extension 'plpgsql'

  create_table 'tasks', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'state'
    t.date 'expired_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'author_id'
    t.bigint 'assignee_id'
    t.index ['assignee_id'], name: 'index_tasks_on_assignee_id'
    t.index ['author_id'], name: 'index_tasks_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'password_digest'
    t.string 'email'
    t.string 'avatar'
    t.string 'type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'tasks', 'users', column: 'assignee_id'
  add_foreign_key 'tasks', 'users', column: 'author_id'
end
