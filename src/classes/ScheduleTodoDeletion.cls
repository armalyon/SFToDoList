/**
 * Created by Bogdan on 28.10.2020.
 */

public with sharing class ScheduleTodoDeletion implements Schedulable {
    public static String CRON_EXP = '0 0 * * * ?'; //every hour
    public static String CRON_EXP_2 = '0 30 * * * ?'; // every hour.30min

    public void execute(SchedulableContext param1) {
        BatchableCleanTodo batchableCleanTodo = new BatchableCleanTodo();
        Database.executeBatch(batchableCleanTodo);
    }
}

//System.schedule('Todo deletion every 30 min', ScheduleTodoDeletion.CRON_EXP_2, new ScheduleTodoDeletion());
// or use Setup > Apex Classes > Shedule Apex Button