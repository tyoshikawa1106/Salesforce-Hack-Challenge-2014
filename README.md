#Salesforce Hack Challenge 2014
<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214170744.png" />  

## Challenge Post Link
- http://jphack2014.challengepost.com/submissions/30742-force-com-developer

## Challenge Skills
- Force.com Sites
- KnockoutJS
- Bootstrap SF1
- Chatter in Apex (Connect API)
- Visualforce
- Apex Component
- Apex Trigger
- Apex Batch (Schedule Batch)
- Salesforce1 Mobile
- Report&Dashboard

## Application
### 応募者登録画面
Force.comサイトで使用するページです。必要事項を入力して登録ボタンをクリックするとSalesforceの応募者オブジェクトに登録されます。色付きの入力欄が必須項目です。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214161045.png" />


登録が完了するとメッセージが表示されます。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214161423.png" />

社内ユーザは応募者タブから情報を参照できます。ブログやGitHubなどのURLを入力してもらうことでどのようなスキルを持つ開発者か確認しやすくなります。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214162846.png" />


### 応募者登録トリガー
応募者登録画面で登録処理が完了するとApexトリガーで通知メールを自動送信します。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214161739.png" />


登録されたメールアドレスが誤っているなどの理由で、メール送信に失敗した場合は送信メールエラーログオブジェクトにエラー内容が登録されます。(メール送信に失敗しても応募者の情報は正常に登録されます。)

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214162026.png" />

### 応募者情報Chatter共有バッチ
登録された応募者情報はスケジュールバッチ処理で対象のChatterグループに自動共有されます。スケジュール実行タイミングは毎日1回深夜の時間帯を想定しています。(応募者登録を実行するForce.comサイトのゲストユーザはChatter投稿処理を実行できないため、ApexトリガーではなくApexバッチ処理を使用して管理者ユーザとして実行します。)

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214164910.png" />

バッチ処理が正常に実行されたとき、Chatterグループには次のように共有されます。非公開グループに共有することで関係者のみ確認できるようになります。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214165807.png" />

詳細ページへのリンクも貼られているので、Chatterフィードから詳細ページへ簡単に移動できます。Chatterグループへの投稿はレコードにも紐付いているので詳細ページからも確認できます。応募者について意見交換したい場合は、ここからChatter投稿やコメントを行います

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214171559.png" />


バッチ処理の対象となる応募者レコードは投稿済み項目にチェックが無いレコードとなります。Chatter投稿処理実行時に投稿済み項目もチェック有りとして更新されるので二回目以降に再共有されるようなことはありません。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214173100.png" />


投稿対象のなるChatterグループはカスタム設定で指定します。カスタム設定に登録されたグループ名と一致するグループにバッチ処理から投稿します。Chatterグループ名が変更された場合はカスタム設定の値を変更することで簡単に対応可能となります。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214174016.png" />

### レポート&ダッシュボードで応募者情報の分析
性別、都道府県、開発経験年数、応募のきっかけと4つのダッシュボードでどのような応募者が多いのか簡単に分析できます。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214174735.png" />


## Demo Video
// 動画追記

## Code
### 応募者登録画面  
- ApplicantRegister.page  
- ApplicantRegisterMain.component  
- ApplicantRegisterJs.resource

### 応募者INSERTトリガー(メール送信)  
- ApplicantTrigger.trigger  
- ApplicantTriggerHandler.cls  
- ApplicantTriggerHandlerTest.cls  
- ApplicantTriggerHelper.cls  
- ApplicantTriggerHelperTest.cls  

### 応募者情報バッチ(Chatter共有)  
- ApplicantFeedPostScheduleInterface.cls
- ApplicantFeedPostScheduleInterfaceTest.cls  
- ApplicantFeedPostScheduleConnect.cls  
- ApplicantFeedPostScheduleConnectTest.cls  
- ApplicantFeedPostBatch.cls
- ApplicantFeedPostBatchTest.cls
- ApplicantFeedPostBatchHelper.cls
- ApplicantFeedPostBatchHelperTest.cls
- ApplicantFeedPostBatchDao.cls
- ApplicantFeedPostBatchDaoTest.cls

### 応募者検索画面  
- ApplicantSearch.page
- ApplicantSearchJs.resource
- ApplicantSearchCss.resource

### 共通処理  
- CommonDao.cls
- CommonDaoTest.cls
- CommonTester.cls
- CommonTesterTest.cls
- CommonCss.resource

### サイト処理
- HackSiteBandwidthExceeded.page
- HackSiteException.page
- HackSiteFileNotFound.page
- HackSiteInMaintenance.page
- HackSiteTemplate.page
- HackSiteThanks.page
- HackSiteUnauthorized.page
- HackSiteCss.resource

## Link
- http://jphack2014.challengepost.com/
- http://jp.force.com/devzone2014/hackchallenge
