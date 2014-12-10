/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class CommonDaoTest {

    private static User testAdminUser = CommonTester.getTestUser();

    /**
     * 組織アドレス取得 テスト
     */
    static testMethod void getOrgWideEmailAddressTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            OrgWideEmailAddress orgWideEmailAddress = CommonDao.getOrgWideEmailAddress(System.Label.OrgWideEmailAddressDisplayName);
            System.assertEquals(String.isNotEmpty(orgWideEmailAddress.Id), true);
            
            Test.stopTest();
        }
    }
}