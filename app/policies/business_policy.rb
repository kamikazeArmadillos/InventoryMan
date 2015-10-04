class BusinessPolicy
  attr_reader :user, :business

  def initialize(user, business)
    @user = user
    @biz = business.id
  end

  def show?
    user_must_be("employee")
  end

  def update?
    user_must_be("manager")
  end

  private

  def get_biz
    @user.businesses.find(@biz).valid?
  end

  def user_must_be(level)
    if get_biz
      case level
      # is employee
      when "employee"
        @user.level >= 0
      # is manager
      when "manager"
        @user.level >= 1
      # is admin
      when "admin"
        @user.level >= 2
      end
    end
  end

end
