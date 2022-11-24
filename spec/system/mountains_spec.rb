require 'rails_helper'

RSpec.describe "Mountains", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:mountain) { FactoryBot.create(:mountain) }

  describe "山の作成" do
  end
end
