class List < ApplicationRecord
  include Visible

  belongs_to :task
end
