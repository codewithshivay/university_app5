class ReviewsController < ApplicationController

    def create
        @course = Course.find(params[:course_id])
        @review = @course.reviews.build(review_params)
        @review.student_id = current_user.id 

        if @review.save
            flash[:notice] = 'Review added successfully.'
            redirect_to @course
        end
    end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end