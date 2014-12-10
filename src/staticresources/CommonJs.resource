$(function() {
    // View Model
    function ApplicantRegisterViewModel() {

        var self = this;

        // 姓
        self.LastName = '吉川';
        // 名
        self.FirstName = '大樹';
        // 性別(man or woman)
        self.Sex = 'man';
        // 生年月日(yyyy-mm-dd)
        self.Birthday = '1985-11-06';
        // 電話
        self.Phone = '090-2246-0238';
        // メール
        self.Email = 'tyoshikawa1106@gmail.com';

        // 郵便番号
        self.PostalCode = '134-0084';
        // 都道府県
        self.State = '東京都';
        // 市区郡
        self.City = '江戸川区';
        // 町名・番地
        self.Street = '東葛西5-38-7';

        // Force.com開発経験 (年)
        self.DevelopmentExperienceYear = 3;
        // Discussion Forum Profile URL
        self.DiscussionForumProfile = 'http://tyoshikawa1106.hatenablog.com/';
        // Success Community Profile URL
        self.SuccessCommunityProfile = 'http://tyoshikawa1106.hatenablog.com/';
        
        // Blog
        self.Blog = 'http://tyoshikawa1106.hatenablog.com/';
        // GitHub
        self.GitHub = 'https://github.com/tyoshikawa1106';
        // SlideShare
        self.SlideShare = 'http://www.slideshare.net/tyoshikawa1106/';

        // Register Button
        self.RegisterBtn = function() {
        	// 姓
	        if (!self.LastName) {
	        	alert('姓を入力してください');
	        	return false;
	        }
	        // 名
	        if (!self.FirstName) {
	        	alert('名を入力してください');
	        	return false;
	        }
	        // 性別
	        if (!self.Sex) {
	        	alert('性別を入力してください');
	        	return false;
	        }
	        // 生年月日
	        if (!self.Birthday) {
	        	alert('生年月日を入力してください');
	        	return false;
	        }
	        // 電話
	        if (!self.Phone) {
	        	alert('電話を入力してください');
	        	return false;
	        }
	        // メール
	        if (!self.Email) {
	        	alert('メールを入力してください');
	        	return false;
	        }


            // 郵便番号
            if (!self.PostalCode) {
                alert('郵便番号を入力してください');
                return false;
            }

            // 都道府県
            if (!self.State) {
                alert('都道府県を入力してください');
                return false;
            }

            // 市区郡
            if (!self.City) {
                alert('市区郡を入力してください');
                return false;
            }

            // 町名・番地
            if (!self.Street) {
                alert('町名・番地を入力してください');
                return false;
            }

	        // 性別値取得
	        var sex = '';
	        if (self.Sex == 'woman') {
	        	sex = '女';
	        } else {
	        	sex = '男';
	        }

	        // 誕生日取得
	        var birthday = new Date(self.Birthday);

	        // 登録処理を実行
	        var newApplicant = new SObjectModel.Applicant__c();
            newApplicant.set('LastName__c', self.LastName);
            newApplicant.set('FirstName__c', self.FirstName);
            newApplicant.set('Sex__c', sex);
            newApplicant.set('Birthday__c', birthday);
            newApplicant.set('Phone__c', self.Phone);
            newApplicant.set('Email__c', self.Email);
            // 住所情報
            newApplicant.set('PostalCode__c', self.PostalCode);
            newApplicant.set('State__c', self.State);
            newApplicant.set('City__c', self.City);
            newApplicant.set('Street__c', self.Street);
            // 開発者情報
            newApplicant.set('DevelopmentExperienceYear__c', self.DevelopmentExperienceYear);
            newApplicant.set('DiscussionForumProfileUrl__c', self.DiscussionForumProfile);
            newApplicant.set('SuccessCommunityProfileUrl__c', self.SuccessCommunityProfile);
            // ソーシャル
            newApplicant.set('BlogUrl__c', self.Blog);
            newApplicant.set('GitHubUrl__c', self.GitHub);
            newApplicant.set('SlideShareUrl__c', self.SlideShare);

            // INSERT
            newApplicant.create(function(err, results, event) {
                if (err) {
                    alert(err.message);
                } else {
                	alert('Thanks!!');
                }
            });
        }
    };
    
    ko.applyBindings(new ApplicantRegisterViewModel());
});