class Status < ApplicationRecord
  belongs_to :character, optional: true
end
