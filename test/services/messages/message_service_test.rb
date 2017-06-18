require 'test_helper'

class MessagesServiceTest < ActiveSupport::TestCase

  test "must extract zero annotated user" do
    annotated_users = Messages::MessagesService.get_annotated_users "aaa bbb aaa ccc"
    assert annotated_users.size == 0
  end

  test "must extract one annotated user" do
    annotated_users = Messages::MessagesService.get_annotated_users "aaa bbb @one aaa ccc"
    assert annotated_users.size == 1
  end

  test "must extract two annotated user" do
    annotated_users = Messages::MessagesService.get_annotated_users "aaa bbb @one aaa ccc @two"
    assert annotated_users.size == 2
  end

  test "if not extract annotated user which doesnt exists" do
    annotated_users = Messages::MessagesService.get_annotated_users "aaa bbb @zero aaa ccc"
    assert annotated_users.size == 0
  end

end
