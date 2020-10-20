
public with sharing class SubToDoTriggerHandler {

    public static void handleAfterInsert(List<Sub_ToDo__c> subToDos) {
        SubToDoTriggerHandlerHelper.sendInsertedSubToDosToExternalOrg(subToDos);
    }

    public static void handleAfterUpdate(List<Sub_ToDo__c> subToDos) {
        SubToDoTriggerHandlerHelper.sendUpdatedSubToDosToExternalOrg(subToDos);
    }

    public static void handleAfterDelete(List<Sub_ToDo__c> subToDos) {
        SubToDoTriggerHandlerHelper.sendDeletedSubToDosToExternalOrg(subToDos);
    }

}