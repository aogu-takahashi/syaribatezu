class MountainsController < ApplicationController
  def index
    @mounts = Mountain.all
  end
end
