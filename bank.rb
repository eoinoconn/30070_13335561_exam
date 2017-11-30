require_relative 'account.rb'

class Bank
  def initialize
    @accounts = {}
  end

  include Enumerable

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
    str = ""
    @accounts.each do |key, value|
      str += @accounts[key].to_s
    end
    str
  end
end