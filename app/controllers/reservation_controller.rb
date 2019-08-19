class ReservationController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def create
    @movie = Movie.find(params[:idMovieReserve])
    @reservation = Reservation.new(
        :id_reservation => @movie.name_movie,
        :identification => params[:cedulaReserve],
        :email => params[:emailReserve],
        :name_user => params[:nombreReserve],
        :number_phone => params[:celularReserve]
    )
    @reservation.save
    zise = @movie.max_size.to_i + 1
    @movie.max_size = zise.to_s
    @movie.save
  end
end
