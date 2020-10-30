
@IsTest
private class SubToDoDtoMapperTest {

    public static Sub_ToDo__c subToDo =
            new Sub_ToDo__c(
                    IsDone__c = false,
                    Description__c = 'hello world',
                    Name = 'Name',
                    Id = 'a0109000001oMvlAAE'

            );

    @IsTest
    public static void mapSubToDoToDtoShouldReturnDto() {

        Test.startTest();
        SubToDoDto result = SubToDoDtoMapper.mapSubToDoToDto(subToDo);
        Test.stopTest();

        System.assertEquals(subToDo.Id, result.id);
        System.assertEquals(subToDo.Name, result.name);
        System.assertEquals(subToDo.Description__c, result.description);
        System.assertEquals(subToDo.IsDone__c, result.isDone);
    }

    @IsTest
    public static void mapSubToDosListToDtosListShouldReturnDtosList(){
        List<Sub_ToDo__c> subToDos = new List<Sub_ToDo__c>();
        subToDos.add(subToDo);

        Test.startTest();
        List<SubToDoDto> results = SubToDoDtoMapper.mapSubToDosListToDtosList(subToDos);
        Test.stopTest();

        for (Integer i = 0; i < subToDos.size(); i++) {
            SubToDoDto result = results.get(i);
            Sub_ToDo__c subToDo = subToDos.get(i);
            System.assertEquals(subToDo.Name, result.name);
            System.assertEquals(subToDo.Id, result.id);
            System.assertEquals(subToDo.Description__c, result.description);
            System.assertEquals(subToDo.IsDone__c, result.isDone);
        }
    }

    @IsTest
    public static void mapSubToDosListToIdsListShouldReturnIdsList(){
        List<Sub_ToDo__c> subToDos = new List<Sub_ToDo__c>();
        subToDos.add(subToDo);

        Test.startTest();
        List<Id> results = SubToDoDtoMapper.mapSubToDosListToIdsList(subToDos);
        Test.stopTest();

        for (Integer i = 0; i < subToDos.size(); i++) {
            System.assertEquals(subToDos.get(i).Id, results.get(i));
        }
    }

}