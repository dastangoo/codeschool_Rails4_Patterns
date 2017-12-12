class PostDecorator
  attr_reader :post
  
  def initialize(post)
    @post = post
  end
  
  # Extract presentation logic out to decorators
  def is_front_page?
    post.published_at > 2.days.ago
  end
  
  def publication_date
    post.created_at.strftime '%Y-%m-%d'
  end
  
  #  Forwards any undefined method to the wrapped object
  def method_missing(method_name, *args, &block)
    post.send(method_name, *args, &block)
  end
  
  def respond_to_missing?(method_name, include_private = false)
    post.respond_to?(method_name, include_private) || super
  end
  
  def classes
    classes = ['page']
    classes << 'front-page' if post.is_front_page?
    classes
  end
end