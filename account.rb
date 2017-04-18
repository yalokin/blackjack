class Account
  attr_accessor :sum

  def initialize(owner, sum)
    @owner = owner
    @sum = sum
  end

  def transfer(recipient, sum)
    raise "Not enough money" if @sum - sum < 0
    @sum -= sum
    recipient.take_money(sum)
  end

  def take_money(sum)
    @sum += sum
  end

end
