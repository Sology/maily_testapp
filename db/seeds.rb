50.times do
  # Create some sample users which are randomly activated or not
  # and fake signup date in the past.
  user = User.create(
    name: Forgery('name').full_name, 
    email: Forgery('email').address,
    active: Forgery('basic').boolean,
    created_at: Time.now - rand(14.days),
  )

  # Let's subscribe all active users to generic communication list.
  if user.active
    MailyHerald.list(:general_communication).subscribe!(user)
  end

  # For some active users create randomly newsletter subscriptions.
  if user.active && Forgery('basic').boolean
    MailyHerald.list(:newsletters).subscribe!(user)
  end
end
