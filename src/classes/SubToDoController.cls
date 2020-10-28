public with sharing class SubToDoController {

    @AuraEnabled(Cacheable = true)
    public static List<Sub_ToDo__c> getSubToDoListByParentToDoId(String toDoId) {
        return [
                SELECT Id, Name, Description__c, IsDone__c
                FROM Sub_ToDo__c
                WHERE ToDo__c = :toDoId
        ];
    }

}