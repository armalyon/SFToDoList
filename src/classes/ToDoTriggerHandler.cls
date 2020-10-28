public with sharing class ToDoTriggerHandler {

    public static void handleAfterInsert(List<ToDo__c>insertedToDos) {
        ToDoTriggerHandlerHelper.sendNewToDosListToExternalOrg(insertedToDos);
    }

    public static void handleAfterUpdate(List<ToDo__c> updatedToDos) {
        ToDoTriggerHandlerHelper.sendUpdatedToDosListToExternalOrg(updatedToDos);
    }

    public static void handleAfterDelete(List<ToDo__c> deletedToDos) {
        if (!System.isBatch()) {
            ToDoTriggerHandlerHelper.sendDeletedToDosListToExternalOrg(deletedToDos);
        }
    }

}