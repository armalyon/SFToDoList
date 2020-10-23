
public with sharing class ToDoController {

    @AuraEnabled
    public static List<ToDo__c> getToDoList() {
        return [
                SELECT Id
                FROM ToDo__c
        ];
    }

    @AuraEnabled
    public static ToDo__c getToDoById(String recordId) {
        return [
                SELECT
                        Name,
                        Description__c,
                        Category__c,
                        Status__c,
                        Start_Date__c,
                        Deadline__c
                FROM ToDo__c
                WHERE Id = :recordId
        ];
    }

}