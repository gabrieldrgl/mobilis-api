class Student < ApplicationRecord
  belongs_to :van
  belongs_to :person
end
