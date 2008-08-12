class Admin < User
  include AdminPermissions
  
  def admin?
    true
  end
end
