class UserMailer < ApplicationMailer
  def user_mail(user)
    @user = user

    mail to: @user.email, subject: "画像投稿の確認メール"
  end
end
