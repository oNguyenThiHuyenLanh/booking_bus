class PagesController < ApplicationController
  def show
    page = page_param
    if valid_page?
      render template: "pages/#{page}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    pages = %w(home booking confirm user)
    pages.include? params[:page]
  end

  def page_param
    params[:page]
  end
end
