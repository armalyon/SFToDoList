
public with sharing class ToDoTriggerHandlerHelper {

    public static void sendNewToDosListToExternalOrg(List<ToDo__c> todosToSend) {
        List<ToDoDto> dtos = ToDoDtoMapper.mapToDosListToDtoList(todosToSend);

        ExternalToDoCalloutManager.postNewToDos(JSON.serializePretty(dtos, true));
    }

    public static void sendUpdatedToDosListToExternalOrg() {

    }

    public static void sendDeletedToDosListToExternalOrg() {

    }

}