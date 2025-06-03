# frozen_string_literal: true

class ClassSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_class_session, only: %i[show edit update destroy]
  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index

  def index
    @class_sessions = policy_scope(ClassSession)
  end

  def show
    authorize @class_session
  end

  def new
    @class_session = ClassSession.new
    authorize @class_session
  end

  def edit
    authorize @class_session
  end

  def create
    @class_session = ClassSession.new(class_session_params)
    @class_session.user = current_user # assuming instructor creates it
    authorize @class_session

    if @class_session.save
      redirect_to @class_session, notice: 'Class session was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @class_session
    if @class_session.update(class_session_params)
      redirect_to @class_session, notice: 'Class session was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @class_session
    @class_session.destroy
    redirect_to class_sessions_url, notice: 'Class session was successfully destroyed.'
  end

  private

  def set_class_session
    @class_session = ClassSession.find(params[:id])
  end

  def class_session_params
    params.require(:class_session).permit(:title, :description, :start_time, :end_time, :studio_id)
  end
end
