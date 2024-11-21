class Monobanka < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "id", "monobankalink"]
  end
end
