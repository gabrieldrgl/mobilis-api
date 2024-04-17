class Driver < ApplicationRecord
  belongs_to :company
  belongs_to :van
  belongs_to :person
end
