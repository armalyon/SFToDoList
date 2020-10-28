/**
 * Created by Bogdan on 27.10.2020.
 */

public with sharing class BatchableCleanTodo implements Database.Batchable <SObject>, Database.AllowsCallouts {
    private String todoStatusToClean = 'Canceled';
    private Integer daysOldTodo = (Integer) [SELECT Days__c FROM CleanTodoConfig__mdt WHERE CleanTodoStatus__c = :todoStatusToClean LIMIT 1].Days__c;

    public Database.QueryLocator start(Database.BatchableContext param1) {
        System.debug('Start batch');
        return Database.getQueryLocator('' +
                'SELECT Id FROM ToDo__c WHERE Deadline__c < LAST_N_DAYS:' + daysOldTodo + ' AND Status__c =: todoStatusToClean');
    }

    public void execute(Database.BatchableContext param1, List<ToDo__c> todos) {
        System.debug('Execute batch');
        if(!Test.isRunningTest()) {
            Set<Id> resultIds = (new Map<Id, ToDo__c>(todos)).keySet();
            ExternalToDoCalloutManager.sendRequestSync(
                    JSON.serializePretty(resultIds),
                    ExternalToDoMetadataManager.geToDoURL(),
                    ExternalToDoCalloutManager.METHOD_DELETE);
        }

        delete todos;
    }

    public void finish(Database.BatchableContext param1) {
        System.debug('finish');
    }
}