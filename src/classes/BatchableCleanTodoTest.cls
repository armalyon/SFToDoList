/**
 * Created by Bogdan on 28.10.2020.
 */

@IsTest
public with sharing class BatchableCleanTodoTest {

    @TestSetup
    static void setUp(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('OauthStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);
        createTestRecord();
        createTestRecord();
    }

    @IsTest
    static void testBatchDeleteOldTodo() {
        List<ToDo__c> todos = [SELECT Id FROM ToDo__c];
        System.assert(todos.size() == 2);

        Test.startTest();
        BatchableCleanTodo batchableCleanTodo = new BatchableCleanTodo();
        Database.executeBatch(batchableCleanTodo);
//        batchableCleanTodo.execute(null, todos);
        Test.stopTest();

        List<ToDo__c> todosAfterBatch = [SELECT Id FROM ToDo__c];
        System.assert(todosAfterBatch.size() == 0);
    }

    static ToDo__c createTestRecord() {
        ToDo__c testTodo = new ToDo__c(
                Name = 'Test record', Description__c = 'Test Batch Delete',
                Status__c = 'Canceled', Category__c = 'Personal',
                Start_Date__c = Date.today().addDays(-20),
                Deadline__c = Date.today().addDays(-10));
        insert testTodo;
        return testTodo;
    }
}