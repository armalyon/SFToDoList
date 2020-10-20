
@IsTest
private class ToDoDtoMapperTest {

    public static ToDo__c todo = new ToDo__c();
    public static ToDoDto todoDto = new ToDoDto();
    public static List<ToDo__c> todos = new List<ToDo__c>();
    public static List<ToDoDto> todoDtos = new List<ToDoDto>();

    @TestSetup
    public static void setUp(){
        todo.Name = 'ToDo 1';
        todo.Description__c = 'This ToDo for testing 1';
        todo.Start_Date__c = System.today();
        todo.Deadline__c = System.today() + 1;
        todo.Status__c = 'Planned';
        todo.Category__c = 'Personal';
        todo.Id = 'a0009000001BGNeAAO';

        todoDto.id = todo.Id;
        todoDto.name = todo.Name;
        todoDto.description = todo.Description__c;
        todoDto.startDate = todo.Start_Date__c;
        todoDto.deadline = todo.Deadline__c;
        todoDto.status = todo.Status__c;
        todoDto.category = todo.Category__c;

        todos.add(todo);
        todoDtos.add(todoDto);

    }


    @IsTest
    static void mapToDoToDtoShouldReturnDto() {
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
    static void mapToDosListToDtoListShouldReturnToDoDtosList(){
        Test.startTest();
        List<ToDoDto> results = ToDoDtoMapper.mapToDosListToDtoList(todos);
        Test.stopTest();
        for (ToDoDto result: results){
            System.assertEquals(todoDto.id, result.id);
            System.assertEquals(todoDto.name, result.name);
            System.assertEquals(todoDto.description, result.description);
            System.assertEquals(todoDto.startDate, result.startDate);
            System.assertEquals(todoDto.deadline, result.deadline);
            System.assertEquals(todoDto.status, result.status);
            System.assertEquals(todoDto.category, result.category);
        }

    }

}