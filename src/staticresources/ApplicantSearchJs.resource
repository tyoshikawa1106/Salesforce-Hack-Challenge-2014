$(function() {
    // View Model
    function ApplicantSearchViewModel() {
        var self = this;
        
        self.searchKey = '';
        self.listItems = ko.observableArray([]);

        var applicantObj = new SObjectModel.Applicant__c();
        applicantObj.retrieve({
            where : {
                CreatedDate :{
                    gte  : new Date('1900/1/1')
                }
            },
            orderby: [{CreatedDate : 'DESC'}],
            limit: 200
        },function(err, results) {
            if(err) {
                alert(err.message);
            } else {
                results.forEach(function(result) {
                    self.listItems.push({
                         LinkUrl: result.get('Id')
                        ,FullName: result.get('FullName__c')
                        ,Other: '(' + result.get('Age__c') + '歳' + ' / ' + 'Force.com開発歴:' + result.get('DevelopmentExperienceYear__c') + '年)'
                    });
                });
            }
        });
        
        // SearchBtn
        self.clickSearchBtn = function() {
            self.listItems.removeAll();

            applicantObj.retrieve({
                where : {
                    FullName__c :{
                        like  : self.searchKey + '%'
                    }
                },
                orderby: [{FullName__c : 'ASC'}],
                limit: 200
            },function(err, results) {
                if(err) {
                    alert(err.message);
                } else {
                    results.forEach(function(result) {                    
                        self.listItems.push({
                             LinkUrl: result.get('Id')
                            ,FullName: result.get('FullName__c')
                            ,Other: '(' + result.get('Age__c') + '歳' + ' / ' + 'Force.com開発歴:' + result.get('DevelopmentExperienceYear__c') + '年)'
                        });
                    });
                }
            });
        };

        // RecordLink
        self.clickRecordLink = function(data) {
            
            if (typeof sforce !== 'undefined' && sforce.one) {
                sforce.one.navigateToSObject(data.LinkUrl); 
            } else {
                location.href = '/' + data.LinkUrl;
            }
        };
    }

    ko.applyBindings(new ApplicantSearchViewModel());
});