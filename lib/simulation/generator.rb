class Simulation::Generator
  # Create some sample users which are randomly activated or not
  # and fake signup date in the past.
  def create(n=50)
    n.times do
      user = User.create(
        name: Forgery('name').full_name,
        email: Forgery('email').address,
        active: Forgery('basic').boolean,
        created_at: Time.now - rand(14.days),
      )

      # For some active users create randomly newsletter subscriptions.
      if Forgery('basic').boolean
        MailyHerald.list(:newsletters).subscribe!(user)
      end
    end
  end

  # Create some sample users and set delivery status
  # AVAILABLE_STATUSES = [:scheduled, :delivered, :skipped, :error]
  def create_and_set_status(n=50, status)
    create(n)
    logs = MailyHerald::Log.last(n)
    logs.each do |log|
      log.status = status
      log.processing_at = Time.now - rand(31.days)
      log.save
    end
  end
end
