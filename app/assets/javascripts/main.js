function newMovie() {
    $("#newMovieModal").modal("show");
}

function reserveMovie(id){
    $("#idMovieReserve").val(id);
    $("#dateReserve").val($("#date").val());
    $("#reserveMovieModal").modal("show");
}