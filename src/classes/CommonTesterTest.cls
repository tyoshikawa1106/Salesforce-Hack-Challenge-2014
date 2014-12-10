/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class CommonTesterTest{

    private static User testAdminUser = CommonTester.getTestUser();
    
    /**
     * テスト実行ユーザ取得 テスト
     */
    static testMethod void getTestUserTest() {
        
        Test.startTest();
        
        User result = CommonTester.getTestUser();
        System.assertEquals(result.Id, UserInfo.getUserId());
        
        Test.stopTest();
    }
    
    /**
     * テスト実行ページ取得 テスト
     */
    static testMethod void getPageReferenceTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            PageReference result = CommonTester.getPageReference();
            System.assertEquals(result.getUrl(), new PageReference('PageReference').getUrl());
            
            Test.stopTest();
        }
    }

    /**
     * 応募者 テストデータ作成
     */
    static testMethod void createApplicantTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            // Insertなし
            Applicant__c applicant = CommonTester.createApplicant(false);
            System.assertEquals(String.isEmpty(applicant.Id), true);
            
            // Insertあり
            applicant = CommonTester.createApplicant(true);
            System.assertEquals(String.isNotEmpty(applicant.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * Chatterグループ テストデータ作成
     */
    static testMethod void createCollaborationGroupTest() {
        
        System.runAs(testAdminUser) {

            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(true);
            String groupName = chatterGroupCtrl.GroupName__c;

            Test.startTest();
            
            // Insertなし
            CollaborationGroup collaborationGroup = CommonTester.createCollaborationGroup(groupName, false);
            System.assertEquals(String.isEmpty(collaborationGroup.Id), true);
            
            // Insertあり
            collaborationGroup = CommonTester.createCollaborationGroup(groupName, true);
            System.assertEquals(String.isNotEmpty(collaborationGroup.Id), true);
            
            Test.stopTest();
        }
    }
    
    /**
     * Chatterグループ設定 テストデータ作成
     */
    static testMethod void createChatterGroupCtrlTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            // Insertなし
            ChatterGroupCtrl__c chatterGroupCtrl = CommonTester.createChatterGroupCtrl(false);
            System.assertEquals(String.isEmpty(chatterGroupCtrl.Id), true);
            
            // Insertあり
            chatterGroupCtrl = CommonTester.createChatterGroupCtrl(true);
            System.assertEquals(String.isNotEmpty(chatterGroupCtrl.Id), true);
            
            Test.stopTest();
        }
    }
}