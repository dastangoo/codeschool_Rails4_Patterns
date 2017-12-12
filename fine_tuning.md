# Fine Tuning
```ruby
items = Item.select(:id).where('due_at < ?', 2.days.from_now)
ids = Item.where('due_at < ?', 2.days.from_now).pluck(:id)
# In Rails 4, pluck even can have multiple arguments
ids = Item.where('due_at < ?', 2.days.from_now).pluck(:id, :name)
```