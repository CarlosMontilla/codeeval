#!/usr/bin/ruby
#
# Simple calculator that accpets a string a eval it content
# without ussing any kind of eval function


class Expression
  attr_reader :exp

  @@MAX_VALUE = 20000
  @@MIN_VALUE = -20000

  def initialize(str)
    @exp = str.delete(" ")
    removeDoubleUnaryMinus exp
  end

  # Eval if the current expression is already a number
  def isFloat?
    !!Float(exp) rescue false
  end

  def breakExp
    op = ""
    e1 = ""
    e2 = ""

    exp_idx = exp.rindex("^")
    mul_idx = exp.rindex(Regexp.new("\\*|/"))
    sum_idx = nil
    (exp.length).downto(0) do |i|
      if exp[i] == "+" or (exp[i] == "-" and not isUnaryMinus i) then
        sum_idx = i
        break
      end
    end

    # Operation breaking
    break_point = 0
    if sum_idx then break_point = sum_idx
    elsif mul_idx then break_point = mul_idx
    else break_point = exp_idx
    end
    e1 = exp[(0...break_point)]
    op = exp[break_point]
    e2 = exp[((break_point+1)...(exp.length))]


    return Expression.new(e1), Expression.new(e2), op
  end

  def evalExp
    if isFloat? then return self
    else
      no_par = self.deleteParentheses
      if no_par.isFloat? then return no_par
      else
        e1, e2, op = no_par.breakExp
        if op == "" then result = e1.evalExp.to_f
        elsif op == "$-" then result = -(e1.evalExp.to_f)
        elsif op == "^" then result = e1.evalExp.to_f ** e2.evalExp.to_f
        elsif op == "*" then result = e1.evalExp.to_f * e2.evalExp.to_f
        elsif op == "/" then result = e1.evalExp.to_f / e2.evalExp.to_f
        elsif op == "+" then result =  e1.evalExp.to_f + e2.evalExp.to_f
        elsif op == "-" then result = e1.evalExp.to_f - e2.evalExp.to_f
        else raise "ERROR!: Unknown operation: " + op + " In expression: " + exp
        end
        return Expression.new(result.to_s)
      end
    end
  end


  def deleteParentheses
    par_idx = exp.index("(")
    if par_idx then
      level = 1
      close_par_idx = 0
      ((par_idx + 1)...(exp.length)).each do |i|

        if exp[i] == "(" then level += 1
        elsif exp[i] == ")" and level == 1 then
          sol_par = Expression.new(exp[((par_idx+1)...i)]).evalExp
          new_exp = exp.sub(exp[((par_idx)..i)], sol_par.exp)
          return Expression.new(new_exp).deleteParentheses
        elsif exp[i] == ")" and level > 1 then level -= 1
        elsif exp[i] == ")" and level < 1 then raise "Expression Error!: Unbalanced Parentheses"
        end
      end
    else
      return self
    end
  end


  # Returns the string with the expression
  def to_s
    return @exp
  end

  # Return the float point of the expression, otherwise raise an error
  def to_f
    if isFloat? then
      value = exp.to_f
      return value
    elsif exp == "Infinity" then return @@MAX_VALUE
    elsif exp == "-Infinity" then return @@MIN_VALUE
    else
      raise "Non-float conversion in expression: " + exp
    end
  end

  def isUnaryMinus i
    if exp[i] != "-" then return false
    elsif i == 0 then return true
    elsif exp[i-1] == "+" then return true
    elsif exp[i-1] == "-" then return true
    elsif exp[i-1] == "*" then return true
    elsif exp[i-1] == "/" then return true
    elsif exp[i-1] == "^" then return true
    elsif exp[i-1] == "(" then return true
    else return false
    end
  end

  def removeDoubleUnaryMinus str
    uminus_flag = 0
    new_str = ""
    (0...(str.length)).each do |i|
      is_uminus = isUnaryMinus i
      if is_uminus and uminus_flag == 0 then
        uminus_flag = 1
      elsif is_uminus and uminus_flag == 1 then
        uminus_flag = 0
      elsif not is_uminus and uminus_flag == 1 then
        new_str += ("-" + str[i])
        uminus_flag = 0
      else
        new_str += str[i]
      end
    end
    @exp = new_str
  end
end

File.open(ARGV[0]).each_line do |line|
  begin
  value = Expression.new(line.delete("\n")).evalExp
  value = value.to_f.round(5).to_s
  if value[-1] == "0"
    puts value.to_i
  else
    puts value
  end
  rescue
    raise "BAD RESULT ERROR! expression: " + line
  end
end
