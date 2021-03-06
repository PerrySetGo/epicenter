class AttendanceStatisticsController < ApplicationController
  authorize_resource :course_attendance_statistics, only: :index
  authorize_resource :student_attendance_statistics, only: :show

  include AttendanceHelper

  def index
    @attendance_statistic = CourseAttendanceStatistics.new(params[:course_id])
  end

  def show
    @student_attendance_stats = StudentAttendanceStatistics.new(current_student)
  end

  def create
    course = Course.find(params[:course_id])
    redirect_to course_day_attendance_records_path(course, day: params[:attendance_records][:day])
  end
end
