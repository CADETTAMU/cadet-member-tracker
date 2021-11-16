# frozen_string_literal: true

require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance = attendances(:one)
  end

  test 'should get index' do
    get attendances_url
    assert_response :success
  end

  test 'should get new' do
    get new_attendance_url
    assert_response :success
  end

  test 'should create attendance' do
    assert_difference('Attendance.count') do
      post attendances_url, params: { attendance: { attended_at: @attendance.attended_at, meeting_number: @attendance.meeting_number, name: @attendance.name, uin: @attendance.uin } }
    end

    assert_redirected_to attendance_url(Attendance.last)
  end

  test 'should show attendance' do
    get attendance_url(@attendance)
    assert_response :success
  end

  test 'should get edit' do
    get edit_attendance_url(@attendance)
    assert_response :success
  end

  test 'should update attendance' do
    patch attendance_url(@attendance), params: { attendance: { attended_at: @attendance.attended_at, meeting_number: @attendance.meeting_number, name: @attendance.name, uin: @attendance.uin } }
    assert_redirected_to attendance_url(@attendance)
  end

  test 'should destroy attendance' do
    assert_difference('Attendance.count', -1) do
      delete attendance_url(@attendance)
    end

    assert_redirected_to attendances_url
  end
end
