class AdminAreaController < ApplicationController
    before_filter :admin_login_required
      layout "admin_area"
end
