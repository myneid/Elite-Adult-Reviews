module UserPermissions
  include GuestPermissions

  def can_move?(topic) false end

  def can_delete?(post)
    # Normal users can delete a post that they wrote, if the post has no children 
    # (hidden children don't count)
    (self.id == post.user_id) and not post.has_undeleted_children?
  end

  def can_edit?(post)
    # Normal users can edit their own posts
    self.id == post.user_id
  end

  def can_change_user_settings?(user_id)
    # Normal users can only change their own settings
    self.id == user_id
  end

  def can_see_user_email?
    [:everyone, :users].include?(RForum::CONFIG[:show_user_email_to])
  end

end

