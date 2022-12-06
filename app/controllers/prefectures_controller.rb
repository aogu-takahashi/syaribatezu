class PrefecturesController < ApplicationController
  skip_before_action :require_login

  def index
    @hokkaido_tohoku = Prefecture.where(name: ["北海道", "青森", "岩手", "宮城", "秋田", "山形", "福島"]).order(:id)
    @kanto = Prefecture.where(name: ["茨城", "栃木", "群馬", "埼玉", "千葉", "東京", "神奈川"]).order(:id)
    @chubu = Prefecture.where(name: ["新潟", "富山", "石川", "福井", "山梨", "長野", "岐阜", "静岡", "愛知"]).order(:id)
    @kinki = Prefecture.where(name: ["三重", "滋賀", "京都", "大阪", "兵庫", "奈良", "和歌山"]).order(:id)
    @chugoku = Prefecture.where(name: ["鳥取", "島根", "岡山", "広島", "山口"]).order(:id)
    @shikoku = Prefecture.where(name: ["徳島", "香川", "愛媛", "高知"]).order(:id)
    @kyushu_okinawa = Prefecture.where(name: ["福岡", "佐賀", "長崎", "熊本", "大分", "宮崎", "鹿児島", "沖縄"]).order(:id)
  end
end
