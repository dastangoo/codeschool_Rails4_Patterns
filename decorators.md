# Decorators
```ruby
@post_decorator = PostDecorator.new(post)
@post_decorator.image 
# This returns false because of using missing_methods and will not search object's ancestors child
# After implementing respond_to_missing method, it will search object's ancestors chain
@post_decorator.respond_to?(:image)
```