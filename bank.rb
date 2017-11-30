require_relative 'account.rb'

class Bank
  def initialize
    @accounts = {}
  end

  def add_account(id)
    @accounts[id] = Account.new(id, 0)
  end

  def deposit(id, amount)
    @accounts[id].deposit(amount)
  end

  def withdraw(id, amount)
    @accounts[id].withdraw(amount)
  end

  def to_s
    @accounts.each &:to_s
  end
end