class Entry < ActiveRecord::Base

  validates :term, presence: true

end
