
trigger ToDoTrigger on ToDo__c (after insert, after update, after delete) {

    if (Trigger.isInsert && Trigger.isAfter) {
        ToDoTriggerHandler.handleAfterInsert(Trigger.new);
    } else if (Trigger.isUpdate && Trigger.isAfter) {
        ToDoTriggerHandler.handleAfterUpdate(Trigger.new);
    } else if (Trigger.isDelete && Trigger.isAfter) {
        ToDoTriggerHandler.handleAfterDelete(Trigger.old);
    }

}