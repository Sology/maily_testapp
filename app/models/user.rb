class User < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Maintain inactive users list
  after_save do |user|
    if user.active?
      MailyHerald.unsubscribe(user, :inactive_users)
    else
      MailyHerald.subscribe(user, :inactive_users)
    end
  end

  # Let's subscribe all users to generic communication list.
  after_create do |user|
    MailyHerald.subscribe(user, :all_users)
    MailyHerald.subscribe(user, :general_communication)
  end

  def activate!
    update_attribute(:active, true)
  end

  # Maily uses that in Web UI to display entities
  def to_s
    self.name
  end
end
