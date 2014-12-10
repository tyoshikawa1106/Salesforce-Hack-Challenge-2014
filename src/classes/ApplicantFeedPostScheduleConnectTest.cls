/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApplicantFeedPostScheduleConnectTest {
    
    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * Schedule Batch
     */
    static testMethod void ApplicantFeedPostScheduleConnectTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // コンストラクタ
            ApplicantFeedPostScheduleInterface cls = new ApplicantFeedPostScheduleInterface();
            // パラメータ
            String sch = '20 30 8 10 2 ?';
            // バッチスケジュール起動
            system.schedule('ApplicantFeedPostScheduleInterfaceJob',sch, cls);  
            
            Test.stopTest();
        }
    }
}