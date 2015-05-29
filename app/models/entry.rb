class Entry < ActiveRecord::Base
  validates :term, presence: true

  scope :existing, ->{ where(archived: false) }
  scope :archived, ->{ where(archived: true) }

  default_scope -> { order(term: :asc) }

  def archive!
    update_attributes!(archived: true)
  end

end
