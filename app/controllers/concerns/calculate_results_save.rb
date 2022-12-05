module CalculateResultsSave
  def results_save(memo_data_params, ration_data_params, drink_data_params)
    memo = Memo.new(memo_data_params)
    memo.user_id = current_user.id
    memo.save

    if ration_data_params[:choco].to_i > 0
      choco = PortableFood.new(volume: ration_data_params[:choco], ration_id: Ration.find_by(id: 1).id, memo_id: memo.id)
      choco.save
    end

    if ration_data_params[:yokan].to_i > 0
      yokan = PortableFood.new(volume: ration_data_params[:yokan], ration_id: Ration.find_by(id: 2).id, memo_id: memo.id)
      yokan.save
    end

    if ration_data_params[:dried_fruit].to_i > 0
      dried_fruit = PortableFood.new(volume: ration_data_params[:dried_fruit], ration_id: Ration.find_by(id: 3).id, memo_id: memo.id)
      dried_fruit.save
    end

    if drink_data_params[:pocari].to_i > 0
      pocari = PortableDrink.new(volume: drink_data_params[:pocari], drink_id: Drink.find_by(name: "ポカリ").id, memo_id: memo.id)
      pocari.save
    end
  end
end