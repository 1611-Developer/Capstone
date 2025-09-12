class StaticPagesController < ApplicationController
  allow_unauthenticated_access only: %i[home about help contact]
  def home
  end

  def help
  end

  def about
  end

  def contact
  end
end
