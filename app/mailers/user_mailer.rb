class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'


    def share_password(user, pass)
        @user = user
        @pass = pass
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
      end
end
