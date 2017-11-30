# Class to model a banking account
class Account
  attr_reader :balance

  def initialize(id, balance)
    @id = id
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def <=>(other)
    @balance <=> other.balance
  end

  def withdraw(amount)
    @balance -= amount
  end

  def to_s
    "Account #{@id} has balance €#{'%.02f' % @balance}\n"
  end
end