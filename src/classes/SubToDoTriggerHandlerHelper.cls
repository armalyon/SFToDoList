
public with sharing class SubToDoTriggerHandlerHelper {
    public static void sendInsertedSubToDosToExternalOrg(List<Sub_ToDo__c> subToDos) {
        List<SubToDoDto> subToDoDtos = SubToDoDtoMapper.mapSubToDosListToDtosList(subToDos);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(subToDoDtos),
                ExternalToDoMetadataManager.getSubToDoURL(),
                ExternalToDoCalloutManager.METHOD_POST
        );
    }

    public static void sendUpdatedSubToDosToExternalOrg(List<Sub_ToDo__c> subToDos) {
        List<SubToDoDto> subToDoDtos = SubToDoDtoMapper.mapSubToDosListToDtosList(subToDos);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(subToDoDtos),
                ExternalToDoMetadataManager.getSubToDoURL(),
                ExternalToDoCalloutManager.METHOD_PUT
        );
    }

    public static void sendDeletedSubToDosToExternalOrg(List<Sub_ToDo__c> subToDos) {
        List<Id> ids = SubToDoDtoMapper.mapSubToDosListToIdsList(subToDos);

        ExternalToDoCalloutManager.sendRequest(
                JSON.serializePretty(ids),
                ExternalToDoMetadataManager.getSubToDoURL(),
                ExternalToDoCalloutManager.METHOD_DELETE
        );
    }

}