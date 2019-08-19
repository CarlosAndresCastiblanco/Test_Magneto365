class MoviesController < ApplicationController
    # default_search_scope :messages
    # before_action :find_movie_by_movie_id, :find_board_if_available, :authorize
    # accept_rss_auth :index, :show
    #
    # helper :sort
    # include SortHelper
    # helper :watchers
    @params
    def index
      @movie = Movie.all
    end

    def show
      @movie = Movie.find(params[:id])
      # respond_to do |format|
      #   format.html {
      #     sort_init 'updated_on', 'desc'
      #     sort_update 'created_on' => "#{Message.table_name}.id",
      #                 'replies' => "#{Message.table_name}.replies_count",
      #                 'updated_on' => "COALESCE(#{Message.table_name}.last_reply_id, #{Message.table_name}.id)"
      #
      #     @topic_count = @board.topics.count
      #     @topic_pages = Paginator.new @topic_count, per_page_option, params['page']
      #     @topics =  @board.topics.
      #         reorder(:sticky => :desc).
      #         limit(@topic_pages.per_page).
      #         offset(@topic_pages.offset).
      #         order(sort_clause).
      #         preload(:author, {:last_reply => :author}).
      #         to_a
      #     @message = Message.new(:board => @board)
      #     render :action => 'show', :layout => !request.xhr?
      #   }
      # end
    end

    def new
      @movie = @movie.boards.build
      @movie.safe_attributes = params[:board]
    end

    def create
      @movie = Movie.new(
                :id_movie => params["1"],
                :name_movie => params[:movieTitle],
                :url_picture => params[:moviePoster],
                :day_present => params[:movieFecha]
      )
      @movie.save
    end

    def edit
    end

    def update
      @movie.safe_attributes = params[:board]
      if @movie.save
        respond_to do |format|
          format.html {
            flash[:notice] = l(:notice_successful_update)
            redirect_to_settings_in_projects
          }
          format.js { head 200 }
        end
      else
        respond_to do |format|
          format.html { render :action => 'edit' }
          format.js { head 422 }
        end
      end
    end

    def destroy
      if @movie.destroy
        flash[:notice] = l(:notice_successful_delete)
      end
      redirect_to_settings_in_projects
    end

=begin
    def params
      params.require(:movie).permit(:id_movie, :name_movie, :url_picture, :day_present, :max_size)
    end
=end
=begin
    def redirect_to_settings_in_projects
      redirect_to settings_movie_path(@movie, :tab => 'movies')
    end

    def find_board_if_available
      @movie = @movie.movie.find(params[:id]) if params[:id]
    rescue ActiveRecord::RecordNotFound
      render_404
    end
=end
  end
