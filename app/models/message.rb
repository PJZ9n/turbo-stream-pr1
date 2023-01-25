class Message < ApplicationRecord
  validates :content, presence: true

  # broadcast with Turbo Streams
  broadcasts inserts_by: :prepend
end
