class Blacklist < ApplicationRecord
  belongs_to :user
  belongs_to :website
end
