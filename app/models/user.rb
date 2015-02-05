class User < ActiveRecord::Base
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Maily uses that in Web UI to display entities
  def to_s
    self.name
  end
end
