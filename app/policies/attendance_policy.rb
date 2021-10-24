# frozen_string_literal: true

class AttendancePolicy < ApplicationPolicy
  attr_reader :current_user, :attendance

  def initialize(current_user, attendance)
    @current_user = current_user
    @attendance = attendance
  end

  def update?
     if (member.is_admin) {

     }    
  end

  def edit?
    @current_user.role == 'admin'    
  end

  def destroy?
    @current_user.role == 'admin'    
  end
end
