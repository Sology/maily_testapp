MailyHerald.setup do |config|
  #config.token_redirect do |controller, subscription|
    #controller.view_context.unsubscribed_path
  #end

  config.context :all_users do |context|
    context.title = "All users"
    context.scope {User.all}
    context.destination = :email
  end

  config.context :inactive_users do |context|
    context.title = "All inactive users"
    context.scope {User.inactive}
    context.destination = :email
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

  config.list :all_users do |list|
    list.title = "All users"
    list.context_name = :all_users
  end

  config.list :inactive_users do |list|
    list.title = "Inactive users"
    list.context_name = :inactive_users
  end

  config.list :general_communication do |list|
    list.title = "General Communication"
    list.context_name = :active_users
  end

  config.list :newsletters do |list|
    list.title = "Standard Newsletters"
    list.context_name = :active_users
  end

  config.ad_hoc_mailing :hello do |mailing|
    mailing.title = "Hi there!"
    mailing.list = :all_users
    mailing.subject = "Hello {{user.name}}!"
    mailing.template = "What's up?"
    mailing.enable
  end

  config.one_time_mailing :welcome do |mailing|
    mailing.title = "Welcome"
    mailing.list = :all_users
    mailing.subject = "Hello {{user.name}}!"
    mailing.template = "Please activate your account. Cheers!"
    mailing.start_at = Proc.new{|user| user.created_at + 5.minutes}
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

  config.sequence :onboarding do |seq|
    seq.title = "Onboarding"
    seq.list = :general_communication
    seq.start_at = "user.created_at"
    seq.enable
    seq.mailing :onboarding_first_message do |mailing|
      mailing.title = "First message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 1.day
      mailing.enable
    end
    seq.mailing :onboarding_second_message do |mailing|
      mailing.title = "Second message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 7.days
      mailing.enable
    end
    seq.mailing :onboarding_final_message do |mailing|
      mailing.title = "Final message"
      mailing.mailer_name = "UserMailer"
      mailing.absolute_delay = 30.days
      mailing.enable
    end
  end
end
