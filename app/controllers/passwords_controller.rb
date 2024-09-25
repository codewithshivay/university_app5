class PasswordsController < ApplicationController

    skip_before_action :require_user, only: [:new, :create, :enter_otp, :verify_otp, :reset_password]

    def new
        
    end

    def create
        @student = Student.find_by(email: params[:email])

        if @student
            otp = generate_otp
            session[:current_time] = Time.now
            StudentMailer.with(student: @student, otp: otp).forgot_password_email.deliver_now
            session[:otp] = otp
            session[:student_email] = params[:email]
            redirect_to enter_otp_passwords_path
        else
            flash.now[:notice] = "Email not found. Please check and try again."
            render 'new'
        end
    end

    def enter_otp
        
    end

    def verify_otp
        
        if params[:otp].to_i == session[:otp].to_i
            current_time =   Time.parse(session[:current_time]).to_i
            two_minutes_later = current_time + (2 * 60)
            new_time = Time.now
            if new_time >= two_minutes_later
                flash[:notice] = "Your OTP has expired!"
                render 'new'
            else
                render 'reset_password'
            end
        else
            flash.now[:notice] = 'Invalid OTP. Please try again.'
            render 'enter_otp'
        end
    end

    def reset_password

        @student = Student.find_by(email: session[:student_email])

        if @student
            @student.password = params[:password]
            if @student.save
                flash[:notice] = "Your password updated successfully!!"
                redirect_to login_path
            else
                flash[:alert] = "There was an error updating your password."
                redirect_to login_path
            end
        else
            flash[:alert] = "Account not found."
            render 'new' 
        end
    end

  private 

    def set_student
        @student = Student.find(params[:id])
    end


    def generate_otp
        rand(1111..9999)
    end

end
