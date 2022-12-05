module CalculateActions
  def calculate(course, data_params)
    # 必要エネルギー量の計算
    # (1.8 * 行動時間(h) + 0.3 * 歩行距離(km) + 10 * 上りの累積標高差(km) + 0.6 * 下りの累積標高差(km) ) * ( 体重(kg) + 荷物重量(kg) ) * 糖質エネルギー比（0.7)
    @amount_of_energy = ((course.walking_time * 1.8 + course.distance * 0.3 + course.denivele_plus * 10.0 + course.denivele_minus * 0.6) * (data_params[:weight].to_i + data_params[:rucksack_weight].to_i) * 0.7).round


    # 必要水分量の計算
    # 体重(kg) * 行動時間(h) * 係数(気温が25度以上▷7、それ以下▷5) 
    # 気温ごとの水分量係数
    coefficient_of_water =  if data_params[:temperature].to_i >= 25
      7
    else
      5
    end

    @amount_of_water = (data_params[:weight].to_i * course.walking_time * coefficient_of_water).round

    # ポカリの必要量
    @pocari = @amount_of_water.round(-2)

    # 行動食のエネルギー量
    ration_energy = @amount_of_energy - @pocari/100 * Drink.find_by(name: "ポカリ").energy

    # ﾁｮｺ・羊羹・ﾄﾞﾗｲﾌﾙｰﾂが1個ずつの場合の合計エネルギー量
    bace_set = Ration.find_by(id: 1).energy + Ration.find_by(id: 2).energy + Ration.find_by(id: 3).energy

    # 上記の3つの食品で必要エネルギー量に対して均等に個数を割り振る
    basic_quantity = ration_energy / bace_set

    # 余りのエネルギー量
    differencial_energy = ration_energy - basic_quantity * bace_set

    # 余りのエネルギー量を各食品のエネルギー量で割り振る
    case differencial_energy
      when 1..50
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity

      when 51..130
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity + 1
      
      when 131..200
        @choco = basic_quantity
        @yokan = basic_quantity + 1
        @dried_fruit = basic_quantity

      when 201..330
        @choco = basic_quantity + 1
        @yokan = basic_quantity 
        @dried_fruit = basic_quantity 

      when 331..430
        @choco = basic_quantity + 1
        @yokan = basic_quantity 
        @dried_fruit = basic_quantity + 1

      when 431..549
        @choco = basic_quantity + 1
        @yokan = basic_quantity + 1
        @dried_fruit = basic_quantity

      else
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity
    end

    # 各食品のエネルギー量
    @choco_energy = @choco * Ration.find_by(id: 1).energy
    @yokan_energy = @yokan * Ration.find_by(id: 2).energy
    @dried_fruit_energy = @dried_fruit * Ration.find_by(id: 3).energy
    @pocari_energy = @pocari/100 * Drink.find_by(name: "ポカリ").energy

    # 行動食＋飲料の合計エネルギー量
    @total_energy = @choco_energy + @yokan_energy + @dried_fruit_energy + @pocari_energy

    @save_data = data_params
  end
end
