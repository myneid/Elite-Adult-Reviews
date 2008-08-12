class Guest
  include GuestPermissions

  attr_accessor :guest_name, :guest_email
  alias :name :guest_name
  alias :email :guest_email

  def initialize(name = nil, email = nil, topic_reads = nil)
    @guest_name, @guest_email = name, email
    @topic_reads = topic_reads
  end

  def id
    nil
  end

  def admin?
    false
  end

  def guest?
    true
  end
  def role
    return 'Guest'
  end

  def can_view_deleted_posts(topic=nil)
    false
  end

  # All associations must return empty array
  def post_votes
    []
  end

  def posts
    []
  end

  def topic_subscriptions
    []
  end

  def id
    nil
  end
  
  def get_display_name
    @guest_name
  end
  
  def last_read_time(topic)
    if @topic_reads && @topic_reads[topic.id]
      Time.at(@topic_reads[topic.id])
    else
      nil
    end
  end

  def update_read_time(topic)
    if @topic_reads
      @topic_reads[topic.id] = Time.now.to_i
    end
  end

  def topic_read_times(topics)
    if @topic_reads
      topic_ids = topics.map {|t| t.id }
      read_times_hash = Hash.new
      topic_ids.each do |topic_id|
        if @topic_reads[topic_id]
          read_times_hash[topic_id] = Time.at(@topic_reads[topic_id])
        end
      end
      return read_times_hash
    else
      return []
    end
  end
end
