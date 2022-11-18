# syaribatezu

### サービスの概要
登山をする際に、必要な食事量・水分量がわかるサービス。

### シャリバテとは
- 登山愛好家たちの業界用語
- 体に蓄えられたグリコーゲンが枯渇してしまい、歩けなくなってしまう危険な現象

### メインのターゲットユーザー
日本100名山など、比較的標高の高い山の登山をする方。

### ユーザーが抱える問題
- 食事量・水分量を計算するには栄養学的知見が必要で分かりにくい
- 食事や水は重量が重いため、登山の際に必要以上の量を持ち歩くのは大変
- 自分にあった食事量・水分量を分析したい

### 解決方法
- スポーツ栄養学に基づいた食事量・水分量を提案する
- 適正量を示すことにより、登山の負担を軽減する
- 登った山、持っていった食事量・水分量を記録し自身の適正量を分析できる

### 実装予定の機能
- 登山に必要な食品・食事量が算出ができる
  - 運動量を推測
    - 登る山の選択
  - 登山日の気温(℃)
  - 登山者のステータス入力
    - 年齢
    - 性別
    - 身長
    - 体重
    - 荷物の重量
  - 推定エネルギー必要量を算出
  - 推定水分摂取量の算出
  - 推奨食品の提示
- 山情報の登録ができる
  - 山名
  - 都道府県
  - コース
  - 日数
  - 歩行時間(h)
  - 歩行距離(km)
  - 上りの累積標高差(km)
  - 下りの累積標高差(km)
- ユーザー登録ができる
  - ユーザーステータス保持機能
  - 登山の記録ができる
    - 登頂した山
    - その際の食事・水分量・荷物重量
- 管理ユーザー機能
  - 登録ユーザーの検索、一覧、詳細、編集
  - 山情報の検索、一覧、詳細、編集、削除
  - 食品情報の、一覧、詳細、編集、削除

### なぜこのポートフォリオを作りたいか？
- スポーツ栄養学の知見に基づいた、サービスを作ることにより登山愛好家の方に登山を安全に楽しんでもらいたい。
- 既存のウェブサービスでも、登山の際の消費エネルギーを計算できるものがあるが、必要な食事量まで提示しているものがない為。


## 画面遷移図
[画面遷移図](https://www.figma.com/file/JFJCiez8NqAQDvkSPFIsAv/%E3%82%B7%E3%83%A3%E3%83%AA%E3%83%90%E3%83%86%E3%81%9A?node-id=0%3A1)

## ER図
[ER図](https://drive.google.com/file/d/1ZmYNgM7ePU-sau5MBrWkuQG6wbXA9XN3/view?usp=sharing)

![steru_fav](https://user-images.githubusercontent.com/97930711/184868518-26a764f0-d6b3-4b76-9686-1cc06397d336.png)

### テーブル・カラムの概要
- usersテーブル
  - rucksack_weight: 荷物重量
- user_mountainsテーブル: ユーザーが登録した山情報
- mountain_locationsテーブル: 山の位置情報
- prefecturesテーブル: 都道府県情報
- cursesテーブル: 山のコース
  - name: コース内容 （例：〇〇峠　〜　〇〇峠　まで）
  - days: 登山にかかる日数
  - walking_time: 歩行時間
  - distance: 登山の歩行距離
  - denivele_plus: 上りの累積標高差
  - denivele_minus: 下りの累積標高差
- memosテーブル:
  - description: 登山記録の詳細
- portable_foodsテーブル: 携帯食品
  - volume: 食品の数量
- rationsテーブル: 行動食情報
  - energy: エネルギー(kcal)
- porable_drinksテーブル: 携帯飲料
  - volume: 飲料の容量
- drinksテーブル: 水分飲料
  - energy: エネルギー(kcal)
