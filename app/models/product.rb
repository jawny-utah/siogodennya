class Product < ApplicationRecord
  alias_attribute :header, :title
end
