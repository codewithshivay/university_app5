class StudentMailer < ApplicationMailer

    def forgot_password_email
        @student = params[:student]
        @otp = params[:otp]
        mail(to: @student.email, subject: 'OTP for Reset Password')
    end
end
