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

### スケジュール
  - 企画〜技術調査：8/4〆切
  - README〜ER図作成：8/7 〆切
  - メイン機能実装：8/8 - 9/6
  - β版をRUNTEQ内リリース（MVP）：9/7〆切
  - 本番リリース：9/20

## 画面遷移図
https://www.figma.com/file/JFJCiez8NqAQDvkSPFIsAv/%E3%82%B7%E3%83%A3%E3%83%AA%E3%83%90%E3%83%86%E3%81%9A?node-id=0%3A1

## ER図
https://drive.google.com/file/d/1ZmYNgM7ePU-sau5MBrWkuQG6wbXA9XN3/view?usp=sharing

https://user-images.githubusercontent.com/97930711/184634616-1b280273-a5d2-4c1a-9b35-4b0bd598c0b6.png