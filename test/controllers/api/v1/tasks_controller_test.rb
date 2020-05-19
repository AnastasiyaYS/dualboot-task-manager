require 'test_helper'
require 'date'

class Api::V1::TasksControllerTest < ActionController::TestCase
  test 'should get show' do
    author = create(:user)
    task = create(:task, author: author)
    get :show, params: { id: task.id, format: :json }
    assert_response :success
  end

  test 'should get index' do
    get :index, params: { format: :json }
    assert_response :success
  end

  test 'should post create' do
    author = create(:user)
    sign_in(author)
    assignee = create(:user)
    task_attributes = attributes_for(:task).
      merge({ assignee_id: assignee.id })
    post :create, params: { task: task_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_task = Task.find(data['task']['id'])

    task_attributes[:expired_at] = Date.parse(task_attributes[:expired_at].strftime('%a, %d %b %Y'))
    assert created_task.present?
    assert_equal task_attributes.stringify_keys, created_task.slice(*task_attributes.keys)
  end

  test 'should put update' do
    author = create(:user)
    assignee = create(:user)
    task = create(:task, author: author)
    task_attributes = attributes_for(:task).
      merge({ author_id: author.id, assignee_id: assignee.id }).
      stringify_keys

    patch :update, params: { id: task.id, format: :json, task: task_attributes }
    assert_response :success

    task_attributes['expired_at'] = Date.parse(task_attributes['expired_at'].strftime('%a, %d %b %Y'))
    task.reload
    assert_equal task.slice(*task_attributes.keys), task_attributes
  end

  test 'should delete destroy' do
    author = create(:user)
    task = create(:task, author: author)
    delete :destroy, params: { id: task.id, format: :json }
    assert_response :success

    assert !Task.where(id: task.id).exists?
  end
end
