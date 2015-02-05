class UserMailer < MailyHerald::Mailer
  def weekly_newsletter user
    mail subject: "Weekly newsletter"
  end

  def onboarding_first_message user
    mail subject: "Onboarding: First message"
  end

  def onboarding_second_message user
    mail subject: "Onboarding: Second message"
  end

  def onboarding_final_message user
    mail subject: "Onboarding: Final message"
  end
end
