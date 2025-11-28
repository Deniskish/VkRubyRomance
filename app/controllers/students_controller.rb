class StudentsController < ApplicationController
  def create
    student = Student.new(student_params)

    if student.save
      token = Digest::SHA256.hexdigest("#{SecureRandom.hex}#{student.id}")
      student.update!(auth_token: token)

      response.set_header("X-Auth-Token", token)

      render json: student, status: :created
    else
      render json: { error: student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    token = request.headers['Authorization']&.split&.last
    student = Student.find_by(id: params[:id])   # 🔴 ВАЖНО: тут params[:id], НЕ :user_id

    unless student
      return render json: { error: "Bad student id" }, status: 400
    end

    if token != student.auth_token
      return render json: { error: "Unauthorized" }, status: 401
    end

    student.destroy
    head :ok
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end
end
