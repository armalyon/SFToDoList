
public with sharing class SubToDoDto {

    public String id { get; set; }
    public String name { get; set; }
    public String description { get; set; }
    public Boolean isDone { get; set; }
    public Id relatedToDo { get; set; }
}