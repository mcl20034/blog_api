class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    params[:page] ||= 1
    @articles = Article.all.page(params[:page])
    set_pagination_header(@articles)
    render 'index'
  end
  
  def create
    
    @article = Article.new(create_params)
    if @article.save
      render 'show'
    else
      @errors = @article.errors
      render 'error'
    end
    
  end

  private
  def create_params
    params.permit(:title,:content)
  end
end
