require 'test_helper'

class ComentRepliesControllerTest < ActionController::TestCase
  setup do
    @coment_reply = coment_replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coment_replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coment_reply" do
    assert_difference('ComentReply.count') do
      post :create, coment_reply: { coment_id: @coment_reply.coment_id, content: @coment_reply.content }
    end

    assert_redirected_to coment_reply_path(assigns(:coment_reply))
  end

  test "should show coment_reply" do
    get :show, id: @coment_reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coment_reply
    assert_response :success
  end

  test "should update coment_reply" do
    patch :update, id: @coment_reply, coment_reply: { coment_id: @coment_reply.coment_id, content: @coment_reply.content }
    assert_redirected_to coment_reply_path(assigns(:coment_reply))
  end

  test "should destroy coment_reply" do
    assert_difference('ComentReply.count', -1) do
      delete :destroy, id: @coment_reply
    end

    assert_redirected_to coment_replies_path
  end
end
