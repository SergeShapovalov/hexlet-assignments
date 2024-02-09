# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push!
    stack = Stack.new

    stack.push! 'ruby'
    assert_equal stack.to_a.length, 1

    stack.push! 'hexlet'
    assert_equal stack.to_a.length, 2

    assert_equal stack.pop!, 'hexlet'
  end

  def test_pop!
    stack = Stack.new
    assert_nil stack.pop!

    stack.push! 'ruby'
    assert_equal stack.pop!, 'ruby'

    stack.push! 'ruby'
    stack.push! 'hexlet'
    assert_equal stack.pop!, 'hexlet'
  end

  def test_clear!
    stack = Stack.new
    assert_empty stack.clear!

    stack.push! 'ruby'
    assert_empty stack.clear!

    stack.push! 'ruby'
    stack.push! 'hexlet'
    assert_empty stack.clear!
  end

  def test_empty?
    stack = Stack.new
    assert stack.empty?

    stack.push! 'ruby'
    refute stack.empty?

    stack.pop!
    assert stack.empty?

    stack.push! 'ruby'
    stack.push! 'hexlet'
    refute stack.empty?

    stack.pop!
    refute stack.empty?
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
