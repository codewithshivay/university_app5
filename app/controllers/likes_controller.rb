class LikesController < ApplicationController

    def create
        @course = Course.find(params[:course_id])
        @like = @course.likes.build(student_id: current_user.id)
        @like.save
        redirect_to root_path
    end
    
    def destroy
        @like = Like.find_by(student_id: current_user.id, course_id: params[:course_id])
        @like.destroy
        redirect_to root_path
    end

end
