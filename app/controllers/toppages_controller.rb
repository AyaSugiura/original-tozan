class ToppagesController < ApplicationController
  def index
    @information = Information.all.order("created_at DESC")
  end
end
