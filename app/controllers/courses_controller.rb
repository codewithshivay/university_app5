class CoursesController < ApplicationController

    skip_before_action :require_user

    def index
        if params[:search].present?
            @courses = Course.where('name LIKE ?', "%#{params[:search]}%")
        else
            @courses = Course.all
        end
    end

end