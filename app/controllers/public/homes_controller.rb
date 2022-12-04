class Public::HomesController < ApplicationController
def top
  def search
    @post_image_search = PostImage.search(params[:keyword])
  end
end

end
