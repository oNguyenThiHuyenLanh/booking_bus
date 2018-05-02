class UserMailer < ApplicationMailer
  def billing user
    @user = user
    mail to: user.email, subject: t("bill_mailer.booked_successfully.subject")
  end
end
