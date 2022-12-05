class PrefecturesController < ApplicationController
  skip_before_action :require_login

  def index
    @prefectures = Prefecture.all.order(:id)
  end
end
