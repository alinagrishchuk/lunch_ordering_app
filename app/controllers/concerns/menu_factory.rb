class MenuFactory
  def initialize(source = nil)
    @source = MenuFactorySource.new(source)
    init_menu
  end

  def create_menu
    save
    @menu
  end

  def build_menu
    @menu
  end

  private

    def init_menu
      @menu = @source.menu? ? Menu.new(@source.menu) : Menu.new
      @menu.product = get_product
    end

    def get_product
      if @source.product?
       Product.where("name = :name and course_type = :course_type",
                     @source.product).
            first_or_initialize(@source.product)
      else
        Product.new
      end
    end

    def save
      @menu.save
    end
end