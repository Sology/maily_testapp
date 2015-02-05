MailyHerald.setup do |config|
  config.token_redirect do |controller, subscription|
    controller.view_context.unsubscribed_path
  end

  config.context :active_users do |context|
    context.title = "All active users"
    context.scope {User.active}
    context.destination = :email
    context.attributes do |user| 
      attribute_group(:user) do
        attribute(:name) {user.name}
        attribute(:email) {user.email}
        attribute(:created_at) {user.created_at}
      end
    end
  end

  config.list :general_communication do |list|
    list.title = "General Communication"
    list.context_name = :active_users
  end

  config.list :newsletters do |list|
    list.title = "Standard Newsletters"
    list.context_name = :active_users
  end

  config.one_time_mailing :hello do |mailing|
    mailing.title = "Hello mailing"
    mailing.list = :general_communication
    mailing.subject = "Hello {{user.name}}!"
    mailing.template = "Hope you'll like Maily. Cheers!"
    mailing.enable
  end

  config.periodical_mailing :weekly_newsletter do |mailing|
    mailing.title = "Weekly newsletter"
    mailing.list = :newsletters
    mailing.mailer_name = "UserMailer"
    mailing.start_at = "user.created_at"
    mailing.period = 1.week
    mailing.enable
  end

  config.sequence :onboarding, locked: true do |seq|
    seq.title = "Onboarding"
    seq.list = :general_communication
    seq.start_at = "user.created_at"
    seq.enable
    seq.mailing :onboarding_first_message, locked: true do |mailing|
      mailing.title = "First message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 1.day
      mailing.enable
    end
    seq.mailing :onboarding_second_message, locked: true do |mailing|
      mailing.title = "Second message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 7.days
      mailing.enable
    end
    seq.mailing :onboarding_final_message, locked: true do |mailing|
      mailing.title = "Final message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 30.days
      mailing.enable
    end
  end
end
