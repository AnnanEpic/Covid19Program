class UserLockdown
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id, type: Integer
  field :breach, type: Boolean
  field :distance, type: Float

end
  
module UserRepresenter
  include Roar::JSON::HAL

  property :user_id
  property :breach
  property :distance
  property :created_at, :writeable=>false

end
