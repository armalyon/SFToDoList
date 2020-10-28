@IsTest
private class ToDoTriggerHandlerHelperTest {

    @IsTest
    static void sendNewToDosListToExternalOrgShouldInvokeCalloutMethodOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<ToDo__c> todos = new List<ToDo__c>();
        Test.startTest();
        ToDoTriggerHandlerHelper.sendNewToDosListToExternalOrg(todos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }

    @IsTest
    static void sendUpdatedToDosListToExternalOrgShouldInvokeCalloutMethodOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<ToDo__c> todos = new List<ToDo__c>();
        Test.startTest();
        ToDoTriggerHandlerHelper.sendUpdatedToDosListToExternalOrg(todos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }

    @IsTest
    static void sendDeletedToDosListToExternalOrgShouldInvokeCalloutMethodOnce() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        List<ToDo__c> todos = new List<ToDo__c>();
        Test.startTest();
        ToDoTriggerHandlerHelper.sendDeletedToDosListToExternalOrg(todos);
        Integer futureCalls = Limits.getFutureCalls();
        Test.stopTest();

        System.assertEquals(1, futureCalls);
    }


}