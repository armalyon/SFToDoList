@IsTest
private class SubToDoControllerTest {

    public static Integer subToDoListSize = 2;

    @TestSetup
    static void setUp(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);

        ToDo__c todo = new ToDo__c(Name='Hello', Description__c='World');
        insert todo;
        Sub_ToDo__c subToDo1 = new Sub_ToDo__c(Name='One', ToDo__c = todo.Id);
        insert subToDo1;
        Sub_ToDo__c subToDo2 = new Sub_ToDo__c(Name='Two', ToDo__c = todo.Id);
        insert subToDo2;

    }

    @IsTest
    static void getSubToDoListByParentToDoIdShouldReturnRelatedSubToDosList() {
        Id todoId = [SELECT Id FROM ToDo__c].get(0).Id;

        Test.startTest();
        List<Sub_ToDo__c> result = SubToDoController.getSubToDoListByParentToDoId(todoId);
        Test.stopTest();
        System.assertEquals(subToDoListSize, result.size());
    }
}