class UserMailer < ApplicationMailer
  def billing user, bill
    @user = user
    @bill = bill
    mail to: user.email, subject: t("bill_mailer.booked_successfully.subject")
  end
end
