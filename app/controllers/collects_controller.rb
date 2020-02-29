class CollectsController < ApplicationController
  def index
    @collects = current_user.collected_posts
  end
end
