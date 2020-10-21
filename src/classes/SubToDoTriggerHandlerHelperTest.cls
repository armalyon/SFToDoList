
@IsTest
private class SubToDoTriggerHandlerHelperTest {

    @IsTest
    static void sendInsertedSubToDosToExternalOrgShouldInvokeFutureCallOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<Sub_ToDo__c> subtodos = new List<Sub_ToDo__c>();
        Test.startTest();
        SubToDoTriggerHandlerHelper.sendInsertedSubToDosToExternalOrg(subtodos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }

    @IsTest
    static void sendUpdatedSubToDosToExternalOrgShouldInvokeFutureCallOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<Sub_ToDo__c> subtodos = new List<Sub_ToDo__c>();
        Test.startTest();
        SubToDoTriggerHandlerHelper.sendUpdatedSubToDosToExternalOrg(subtodos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }

    @IsTest
    static void sendDeletedSubToDosToExternalOrgShouldInvokeFutureCallOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<Sub_ToDo__c> subtodos = new List<Sub_ToDo__c>();
        Test.startTest();
        SubToDoTriggerHandlerHelper.sendDeletedSubToDosToExternalOrg(subtodos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }
}