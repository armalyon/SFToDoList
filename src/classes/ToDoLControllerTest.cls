@IsTest
private class ToDoLControllerTest {

    @TestSetup
    static void setUp() {
        ToDo__c toDo1 = new ToDo__c(
                Name = 'Test',
                Description__c = 'Description',
                Category__c = 'Personal',
                Status__c = 'Planned',
                Start_Date__c = Date.today(),
                Deadline__c = Date.today() + 1
        );

        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        insert toDo1;
    }

    @IsTest
    static void getToDoListShouldReturnToDoList() {
        ToDo__c toDo1 = [SELECT Id FROM ToDo__c WHERE Name = 'Test'];

        Test.startTest();
        List<ToDo__c> results = ToDoController.getToDoList();
        Test.stopTest();

        System.assert(results != null);
        for (ToDo__c result: results){
            System.assertEquals(toDo1.Id, result.Id);

        }

    }
}