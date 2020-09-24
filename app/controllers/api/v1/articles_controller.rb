class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token  

  # GET /articles
  def index
    @articles = Article.all
    respond_to do |format|
      format.html 
      format.json { render json: { data1: @articles, data2: "This is Bhargav"} }  # if root path is not given to index 
    end
  end

  # GET /articles/1
  def show
    respond_to do |format|
      format.html 
      format.json { render json: {name: "Bhargav", data: @article} }
      # format.json { render json: @article }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to api_v1_article_path(@article) }
        format.json { render json: @article, status: :created, location: api_v1_article_url(@article) }
      else
        format.html { render new_api_v1_article_path(@article), action: :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to api_v1_article_path(@article) }
        format.json { render json: @article, status: :ok, location: api_v1_article_url(@article) }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    if @article.destroy
      render json: { status: 'done', message: "Article #{@article.title} deleted." }
    else
      render json: { status: 'failed', message: "Article #{@article.title} is failed to delete." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :slug)
    end
end
