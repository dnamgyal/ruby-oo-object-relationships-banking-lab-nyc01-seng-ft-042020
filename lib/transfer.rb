class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if valid? && @sender.balance > amount
      @sender.deposit(0 - amount)
      @receiver.deposit(amount)
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
