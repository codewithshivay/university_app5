class VideosController < ApplicationController


    def show
        @video = Video.find(params[:id])
        if !(current_user.courses.include?(@video.course))
            flash[:notice] = "First Enroll to that Course"
            redirect_to root_path
        end
    end

end
