module GuestPermissions
  def can_create_topic_in?(forum) true end
=begin
  def can_reply_to?(topic)
    if topic.locked?
      false
    else
      true
    end
  end
=end
  def can_reply_to?(topic) false end

  def can_move?(topic) false end

  def can_delete?(post) false end
  def can_delete_recursive?(post) false end
  def can_undelete?(post) false end
  def can_undelete_recursive?(post) false end

  def can_edit?(post) false end

  def can_view_deleted_posts?(topic=nil) false end

  def can_change_user_settings?(topic) false end

  def can_see_user_email?
    RForum::CONFIG[:show_user_email_to] == :everyone
  end
end
