class MenuFactory

  def initialize(params)
    @name, @type, @weekly = params[:name], params[:course_type].to_i, params[:weekly]
    init_product
    init_menu(params)
  end

  def create_menu
    save
    @menu
  end

  private

    def init_product
      @product = Product.where("name = ? and course_type = ?",
                               @name, @type).
          first_or_initialize(name: @name, course_type: @type)
    end

    def init_menu params
      @menu  = Menu.new(params.slice(:price, :organization_id))
      set_period
    end

    def set_period
      if @weekly == '1'
        @menu.date_from = Date.today
        @menu.date_to = Date.today.sunday
      else
        @menu.date_from = @menu.date_to = Date.today
      end

    end

    def save
      @menu.product = @product
      @menu.save
    end

end