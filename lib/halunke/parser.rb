#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require "halunke/lexer"
require "halunke/nodes"

module Halunke
  class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 41)

def parse(code)
  @tokens = Lexer.new.tokenize(code)
  do_parse
end

def next_token
  @tokens.shift
end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     6,     7,     8,     5,    10,     9,     6,     7,     8,     5,
    13,     9,     6,     7,     8,    15,   nil,     9,     6,     7,
     8,     5,   nil,     9 ]

racc_action_check = [
     0,     0,     0,     0,     1,     0,     3,     3,     3,     3,
    10,     3,     5,     5,     5,    14,   nil,     5,    12,    12,
    12,    12,   nil,    12 ]

racc_action_pointer = [
    -2,     4,   nil,     4,   nil,    10,   nil,   nil,   nil,   nil,
    10,   nil,    16,   nil,     9,   nil ]

racc_action_default = [
    -2,   -10,    -1,    -2,    -4,   -10,    -6,    -7,    -8,    -9,
   -10,    -3,    -2,    16,   -10,    -5 ]

racc_goto_table = [
     2,     1,    12,    11,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    14 ]

racc_goto_check = [
     2,     1,     4,     2,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     1,     0,   nil,    -3 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 9, :_reduce_1,
  0, 10, :_reduce_2,
  2, 10, :_reduce_3,
  1, 11, :_reduce_none,
  4, 11, :_reduce_5,
  1, 12, :_reduce_6,
  1, 12, :_reduce_7,
  1, 12, :_reduce_8,
  1, 12, :_reduce_9 ]

racc_reduce_n = 10

racc_shift_n = 16

racc_token_table = {
  false => 0,
  :error => 1,
  :NUMBER => 2,
  :STRING => 3,
  :BAREWORD => 4,
  :OPEN_PAREN => 5,
  :CLOSE_PAREN => 6,
  :OPERATOR => 7 }

racc_nt_base = 8

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NUMBER",
  "STRING",
  "BAREWORD",
  "OPEN_PAREN",
  "CLOSE_PAREN",
  "OPERATOR",
  "$start",
  "Program",
  "Expressions",
  "Expression",
  "Literal" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 11)
  def _reduce_1(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 15)
  def _reduce_2(val, _values, result)
     result = Nodes.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 16)
  def _reduce_3(val, _values, result)
     result = Nodes.new([val[0]]).concat(val[1]) 
    result
  end
.,.,

# reduce 4 omitted

module_eval(<<'.,.,', 'grammar.y', 21)
  def _reduce_5(val, _values, result)
     result = Halunke::MessageSendNode.new(val[1], MessageNode.new(val[2].nodes)) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 25)
  def _reduce_6(val, _values, result)
     result = NumberNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 26)
  def _reduce_7(val, _values, result)
     result = StringNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 28)
  def _reduce_8(val, _values, result)
     result = BarewordNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 29)
  def _reduce_9(val, _values, result)
     result = BarewordNode.new(val[0]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Halunke