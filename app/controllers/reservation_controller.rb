class ReservationController < ApplicationController
  def index
  end

  def create
    @reservation = Reservation.new(params)
    @reservation.save
    redirect_to @reservation
  end

  private
  def params
    params.require(:reservation).permit(:id_reservation, :identification, :email, :name_user, :number_phone)
  end
end
