class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  broadcasts_to :room

  # default_scope { order("created_at DESC") }
end
