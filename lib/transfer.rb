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
    if valid? && @sender.balance > amount  && @status == "pending"
      @sender.deposit(0 - amount)
      @receiver.deposit(amount)
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @receiver.balance > amount && @status == "complete"
   # if valid?
      @receiver.deposit( 0 - amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end

end
