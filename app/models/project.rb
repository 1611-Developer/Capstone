class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :repository_link, presence: true

  def slug
    name.parameterize
  end

end
