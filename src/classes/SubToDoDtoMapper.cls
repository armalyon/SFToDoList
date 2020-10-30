
public with sharing class SubToDoDtoMapper {

    public static SubToDoDto mapSubToDoToDto(Sub_ToDo__c subToDo){
        SubToDoDto dto = new SubToDoDto();
        dto.id = subToDo.Id;
        dto.relatedToDo = subToDo.ToDo__c;
        dto.name = subToDo.Name;
        dto.description = subToDo.Description__c;
        dto.isDone = subToDo.IsDone__c;

        return dto;
    }

    public static List<SubToDoDto> mapSubToDosListToDtosList(List<Sub_ToDo__c> subToDos){
        List<SubToDoDto> dtos = new List<SubToDoDto>();
        for (Sub_ToDo__c subToDo: subToDos){
            dtos.add(mapSubToDoToDto(subToDo));
        }
        return dtos;
    }

    public static List<Id> mapSubToDosListToIdsList(List<Sub_ToDo__c> subToDos){
        List<Id> ids = new List<Id>();
        for (Sub_ToDo__c subToDo: subToDos){
            ids.add(subToDo.Id);
        }

        return ids;
    }

}