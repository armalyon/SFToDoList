
trigger SubToDoTrigger on Sub_ToDo__c (after insert, after update, after delete) {
    if (Trigger.isInsert && Trigger.isAfter) {
        SubToDoTriggerHandler.handleAfterInsert(Trigger.new);
    } else if (Trigger.isUpdate && Trigger.isAfter) {
        SubToDoTriggerHandler.handleAfterUpdate(Trigger.new);
    } else if (Trigger.isDelete && Trigger.isAfter) {
        SubToDoTriggerHandler.handleAfterDelete(Trigger.old);
    }
}