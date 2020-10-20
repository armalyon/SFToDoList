
public with sharing class ToDoTriggerHandler {

    public static void handleAfterInsert(List<ToDo__c>insertedToDos){
        ToDoTriggerHandlerHelper.sendNewToDosListToExternalOrg(insertedToDos);
    }

    public static void handleAfterUpdate() {
        ToDoTriggerHandlerHelper.sendUpdatedToDosListToExternalOrg();
    }

    public static void handleAfterDelete() {
        ToDoTriggerHandlerHelper.sendDeletedToDosListToExternalOrg();
    }

}