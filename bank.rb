# Class to model a bank, stores accounts in hashtables
# holds array of tellers

require_relative 'account.rb'
require_relative 'teller.rb'

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
    transactions.size.times do
      process_transaction(@tellers[rand(@tellers.size)], transactions.pop)
      end
  end

  # Checks to see if tellers are busy before assigning them a transaction
  def process_transactions_smartly (transactions)
    time = 0
    # sort so that most efficient teller goes first
    @tellers.sort! { |x, y| x.processing_time <=> y.processing_time}
    while transactions.size != 0
      @tellers.each do |teller|
        if not_busy(teller, time)
          process_transaction(teller, transactions.pop)
        end
      end
      time += 1
    end
  end

  def teller_state
    str = @tellers.inject("") { |str, teller| str += teller.to_s}
    # total_time_taken = @tellers.inject(0) { |sum, teller| sum += teller.time_to_process}
    # str += "Total time taken: #{total_time_taken}"
  end

  private

  # method for teller to process transaction
  def process_transaction(teller, transaction)
    if(transaction[1] > 0)
      deposit(transaction[0], transaction[1])
    elsif(transaction[1] < 0)
      withdraw(transaction[0], transaction[1])
    end
    teller.processed_transaction
  end

  # cehcks if teller is busy at given time
  def not_busy(teller, time)
    teller.time_to_process < time
  end

end