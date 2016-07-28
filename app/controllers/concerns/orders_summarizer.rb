class OrdersSummarizer
  attr_reader :orders,:cost

  def initialize date
    @orders = Order.find_by_day_full(date)
    @cost =  @orders ? total_price : 0
  end

  private
    def total_price
      @orders.inject(0) do |sum, order|
        sum +=  (order.menus.inject(0) do |sum, menu|
          sum += (menu.price)
        end)
      end
    end

end