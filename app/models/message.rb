class Message < ApplicationRecord
  belong_to :room
  belong_to :user
end
