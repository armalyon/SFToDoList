
public with sharing class ToDoTriggerHandlerHelper {

    public static void sendNewToDosListToExternalOrg(List<ToDo__c> todosToSend) {
        List<ToDoDto> dtos = ToDoDtoMapper.mapToDosListToDtoList(todosToSend);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(dtos),
                ExternalToDoMetadataManager.geToDoURL(),
                ExternalToDoCalloutManager.METHOD_POST
        );
    }

    public static void sendUpdatedToDosListToExternalOrg(List<ToDo__c> todosToUpdate) {
        List<ToDoDto> dtos = ToDoDtoMapper.mapToDosListToDtoList(todosToUpdate);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(dtos),
                ExternalToDoMetadataManager.geToDoURL(),
                ExternalToDoCalloutManager.METHOD_PUT
        );
    }

    public static void sendDeletedToDosListToExternalOrg(List<ToDo__c> deletedToDos) {
        List<Id> idsToDelete = ToDoDtoMapper.mapToDosListToIdsList(deletedToDos);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(idsToDelete),
                ExternalToDoMetadataManager.geToDoURL(),
                ExternalToDoCalloutManager.METHOD_DELETE
        );
    }

}