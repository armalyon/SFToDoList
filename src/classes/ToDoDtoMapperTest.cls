
@IsTest(SeeAllData = true)
private class ToDoDtoMapperTest {

    public static ToDo__c todo = new ToDo__c(
            Name = 'ToDo 1',
            Description__c = 'This ToDo for testing 1',
            Start_Date__c = System.today(),
            Deadline__c = System.today() + 1,
            Status__c = 'Planned',
            Category__c = 'Work',
            Id = 'a0009000001BGNeAAO',
            RecordTypeId = Schema.SObjectType.ToDo__c.getRecordTypeInfosByName().get('Personal').getRecordTypeId()
    );


    @IsTest
    static void mapToDoToDtoShouldReturnDto() {
        ToDoDto todoDto = new ToDoDto();
        todoDto.id = todo.Id;
        todoDto.name = todo.Name;
        todoDto.description = todo.Description__c;
        todoDto.startDate = todo.Start_Date__c;
        todoDto.deadline = todo.Deadline__c;
        todoDto.status = todo.Status__c;
        todoDto.category = todo.Category__c;
        todoDto.recordTypeName = 'Personal';

        Test.startTest();
        ToDoDto result = ToDoDtoMapper.mapToDoToDto(todo);
        Test.stopTest();
        System.assertEquals(todoDto.id, result.id);
        System.assertEquals(todoDto.name, result.name);
        System.assertEquals(todoDto.description, result.description);
        System.assertEquals(todoDto.startDate, result.startDate);
        System.assertEquals(todoDto.deadline, result.deadline);
        System.assertEquals(todoDto.status, result.status);
        System.assertEquals(todoDto.category, result.category);
    }


    @IsTest
    static void mapToDosListToDtoListShouldReturnToDoDtosList() {
        ToDoDto todoDto = new ToDoDto();
        todoDto.id = todo.Id;
        todoDto.name = todo.Name;
        todoDto.description = todo.Description__c;
        todoDto.startDate = todo.Start_Date__c;
        todoDto.deadline = todo.Deadline__c;
        todoDto.status = todo.Status__c;
        todoDto.category = todo.Category__c;
        todoDto.recordTypeName = 'Personal';

        List<ToDo__c> todos = new List<ToDo__c>();
        todos.add(todo);

        Test.startTest();
        List<ToDoDto> results = ToDoDtoMapper.mapToDosListToDtoList(todos);
        Test.stopTest();
        for (ToDoDto result : results) {
            System.assertEquals(todoDto.id, result.id);
            System.assertEquals(todoDto.name, result.name);
            System.assertEquals(todoDto.description, result.description);
            System.assertEquals(todoDto.startDate, result.startDate);
            System.assertEquals(todoDto.deadline, result.deadline);
            System.assertEquals(todoDto.status, result.status);
            System.assertEquals(todoDto.category, result.category);
        }

    }

    @IsTest
    static void mapToDosListToIdsListShouldReturnIdsList() {
        List<ToDo__c> todos = new List<ToDo__c>();
        todos.add(todo);

        Test.startTest();
        List<Id> results = ToDoDtoMapper.mapToDosListToIdsList(todos);
        Test.stopTest();
        for (Id result : results) {
            System.assertEquals(todo.Id, result);
        }
    }

}