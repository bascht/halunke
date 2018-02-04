require "test_helper"

class NodesTest < Minitest::Test
  def setup
    @context = Halunke::HContext.root_context
  end

  def test_number_node_eval
    number_node = Halunke::NumberNode.new(7)

    assert_equal 7, number_node.eval(@context).ruby_value
  end

  def test_string_node_eval
    string_node = Halunke::StringNode.new("test")

    assert_equal "test", string_node.eval(@context).ruby_value
  end

  def test_nodes
    node1 = Halunke::NumberNode.new(1)
    node2 = Halunke::NumberNode.new(2)
    nodes = Halunke::Nodes.new([node1, node2])

    assert_equal 2, nodes.eval(@context).ruby_value
  end

  def test_message_send
    message = Object.new
    message_node = Minitest::Mock.new
    message_node.expect :eval, [message], [@context]
    receiver = Minitest::Mock.new
    receiver.expect :receive_message, :result, [message]
    receiver_node = Minitest::Mock.new
    receiver_node.expect :eval, receiver, [@context]
    node = Halunke::MessageSendNode.new(receiver_node, message_node)

    assert_equal :result, node.eval(@context)
  end

  def test_message_with_no_args
    a = Halunke::BarewordNode.new("a")
    node = Halunke::MessageNode.new([a])

    assert_equal ["a", []], node.eval(@context)
  end

  def test_message_with_one_arg
    a = Halunke::BarewordNode.new("a")
    b = Minitest::Mock.new
    b.expect :eval, :b_evaluated, [@context]
    node = Halunke::MessageNode.new([a, b])

    assert_equal ["a", [:b_evaluated]], node.eval(@context)
  end

  def test_message_with_two_args
    a = Halunke::BarewordNode.new("a")
    b = Minitest::Mock.new
    b.expect :eval, :b_evaluated, [@context]
    c = Halunke::BarewordNode.new("c")
    d = Minitest::Mock.new
    d.expect :eval, :d_evaluated, [@context]
    node = Halunke::MessageNode.new([a, b, c, d])

    assert_equal ["a c", [:b_evaluated, :d_evaluated]], node.eval(@context)
  end
end