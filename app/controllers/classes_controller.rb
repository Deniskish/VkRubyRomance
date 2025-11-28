class ClassesController < ApplicationController
    def index
      classes = SchoolClass.where(school_id: params[:school_id])
      render json: { data: classes }
    end
  end
  