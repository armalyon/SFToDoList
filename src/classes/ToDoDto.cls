
public with sharing class ToDoDto {

    public String id { get; set; }
    public String name { get; set; }
    public String description { get; set; }
    public Date startDate { get; set; }
    public Date deadline { get; set; }
    public String category { get; set; }
    public String status { get; set; }
    public String recordTypeName {get; set;}

}