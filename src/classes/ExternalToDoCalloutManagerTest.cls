@IsTest
private class ExternalToDoCalloutManagerTest {

    @IsTest(SeeAllData=true)
    static void sendRequestShouldDoTwoCallouts() {

        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();
        ExternalToDoCalloutManager.sendRequest('[]', 'https://youtube.com', 'POST');
        Integer futureCallsNumber = Limits.getFutureCalls();
        Test.stopTest();
        System.assert(futureCallsNumber == 1);
    }
}