class ShortUrlsController < ApplicationController

  def click
    @short_url = ShortUrl.find_by_slug params[:slug]
    @short_url.click! request.env

    redirect_to @short_url.source_url
  end

end
