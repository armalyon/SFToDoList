
public with sharing class ToDoDtoMapper {

    public static ToDoDto mapToDoToDto(ToDo__c toDo) {
        ToDoDto dto = new ToDoDto();
        dto.id = toDo.Id;
        dto.name = toDo.Name;
        dto.description = toDo.Description__c;
        dto.status = toDo.Status__c;
        dto.category = toDo.Category__c;
        dto.startDate = toDo.Start_Date__c;
        dto.deadline = toDo.Deadline__c;

        return dto;
    }

    public static List<ToDoDto> mapToDosListToDtoList(List<ToDo__c> toDos){
        List<ToDoDto> dtos = new List<ToDoDto>();

        for (ToDo__c todo: toDos){
            ToDoDto dto = mapToDoToDto(todo);
            dtos.add(dto);
        }
        return dtos;
    }

}