class User < ActiveRecord::Base


  validates_uniqueness_of :name, :message => :user_name_duplicate
  validates_uniqueness_of :email, :message => :user_email_duplicate
  validates_format_of :name, :with => /\A[a-z0-9\-_]{3,20}\Z/i, :on => :create, :message => :user_name_invalid
  validates_format_of :firstname, :with => /\A.{2,20}\Z/i, :message => :user_firstname_invalid
  validates_format_of :surname, :with => /\A.{0,20}\Z/i, :message => :user_surname_invalid
  #          apply_captcha :message => "Security code did not match"
  attr_accessor :old_password, :new_password, :retyped_password

  include UserPermissions



  def self.find_by_login(name, password)
    raise ArgumentError if name.nil?
    raise ArgumentError if password.nil?
    if name.include? '@'
      # email address instead of name given
      self.find_by_email_and_password(name, Digest::MD5.hexdigest(password))
    else
      self.find_by_name_and_password(name, Digest::MD5.hexdigest(password))
    end
  end

  def self.find_by_token(id, token)
    raise ArgumentError if id.nil?
    raise ArgumentError if token.nil?
    user = self.find(:first, :conditions => ["id='%s' AND security_token='%s'", id, token])
    if user.nil? or user.token_expired?
      return nil
    else
      return user
    end
  end

  def self.delete_inactive_accounts
    self.destroy_all(['activated = 0 AND created_at < ?', 7.days.ago])
  end


  def guest?
    false
  end

  def generate_security_token
    if self.security_token.nil? or self.token_expiry.nil? or
      (Time.now.to_i + token_lifetime / 2) >= self.token_expiry.to_i
      return new_security_token
    else
      return self.security_token
    end
  end

  def encrypt_password(new_password)
    self['password'] = Digest::MD5.hexdigest(new_password)
  end

  def guest_email
    nil
  end

  def guest_name
    nil
  end

  def makepass
    chars = ("a".."z").to_a + (1..9).to_a
    chars = chars.sort_by { rand }
    s = chars[0..7].to_s
  end

  def admin?
    false
  end

  def editor?
    false
  end

  def token_expired?
    self.security_token and self.token_expiry and (Time.now > self.token_expiry)
  end

  def get_display_name
               "#{self.name}"
  end


  private
  def new_security_token
    self['security_token'] =
      Digest::MD5.hexdigest(self['password'] + (Time.now.to_i.to_s) + rand.to_s)
    self.token_expiry = Time.at(Time.now.to_i + token_lifetime)
    self.save
    return self['security_token']
  end

  def token_lifetime
    86400
  end


  def generate_email_address_change_key
    generate_key(self.id, self.future_email_address)
  end

  def generate_key(*args)
    Digest::MD5.hexdigest('hustlerhustlerhustler' + args.join("\n"))
  end
end
