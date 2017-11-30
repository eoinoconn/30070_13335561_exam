require_relative 'account.rb'

class Bank
  def initialize
    @accounts = {}
    @tellers = []
  end

  include Enumerable

  def each
    @accounts.each do |key, value|
      yield @accounts[key]
    end
  end

  def add_teller(teller)
    @tellers.push(teller)
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

  def size
    @accounts.size
  end

  def to_s
    str = ""
    @accounts.each do |key, value|
      str += @accounts[key].to_s
    end
    str
  end

  def process_transactions_randomly(transactions)
    @tellers.shuffle!
    process_transaction(@tellers[rand(@tellers.size - 1)], transactions.pop)
  end

  def process_transaction(teller, transaction)
    if(transaction[1] > 0)
      deposit(transaction[0], transaction[1])
    elsif(transaction[1] < 0)
      withdraw(transaction[0], transaction[1])
    end
    teller.processed_transaction
  end

  def teller_state

  end
end