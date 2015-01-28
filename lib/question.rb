class Question < ActiveRecord::Base
  belongs_to(:survey)
    validates(:description, :presence => true)
end
