#Salesforce Hack Challenge 2014
<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214145915.png" />  

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


### 応募者登録トリガー
応募者登録画面で登録処理が完了するとApexトリガーで通知メールを自動送信します。

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214161739.png" />


登録されたメールアドレスが誤っているなどの理由で、メール送信に失敗した場合は送信メールエラーログオブジェクトにエラー内容が登録されます。(メール送信に失敗しても応募者の情報は正常に登録されます。)

<img src="http://f.st-hatena.com/images/fotolife/t/tyoshikawa1106/20141214/20141214162026.png" />


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
