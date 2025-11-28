class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: :students

  # GET /schools/:school_id/classes
  def index
    classes = SchoolClass.where(school_id: params[:school_id])

    render json: { data: classes }, status: :ok
  end

  # GET /schools/:school_id/classes/:class_id/students
  def students
    students = Student.where(class_id: params[:class_id], school_id: params[:school_id])

    render json: { data: students }, status: :ok
  end

  private

  def set_school_class
    @school_class = SchoolClass.find_by(id: params[:class_id], school_id: params[:school_id])
    unless @school_class
      render json: { error: "Class not found" }, status: 404
    end
  end
end
