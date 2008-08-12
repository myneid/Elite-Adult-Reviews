module AdminPermissions
  include UserPermissions

  def can_create_topic_in?(forum) true end
  def can_reply_to?(topic) true end

  def can_move?(topic) true end
  
  def can_delete?(post) true end
  def can_delete_recursive?(post) true end
  def can_undelete?(post) true end
  def can_undelete_recursive?(post) true end

  def can_edit?(post) true end

  def can_view_deleted_posts?(topic=nil) true end

  def can_change_user_settings?(user_id) true end

  def can_see_user_email?() true end
end
