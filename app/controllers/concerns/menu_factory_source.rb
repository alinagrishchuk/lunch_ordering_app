class MenuFactorySource
  attr_reader :name, :course_type, :weekly, :organization_id, :price

  def initialize source=nil
    read(source) if source
  end

  def product?
    !product.empty?
  end

  def menu?
    !menu.empty?
  end

  def menu
    { price:            price,
      organization_id:  organization_id }.merge(menu_period).compact
  end

  def menu_period
    if @weekly == '1'
      { date_from:  Date.today,
        date_to:    Date.today.sunday }
    else
      { date_from:  Date.today,
        date_to:    Date.today }
    end
  end

  def product
    { name:        name,
      course_type: course_type }.compact
  end

  private
    def read(source)
      @name, @course_type = source[:name], source[:course_type].to_i
      @weekly, @organization_id, @price  =  source[:weekly], source[:organization_id].to_i, source[:price]
    end
end