global class BatchAccountSchedule implements Schedulable {
    
    global void execute (System.SchedulableContext ctx){ 
        
        BatchAccountCA EveryWeek = new BatchAccountCA();
        Database.executeBatch(EveryWeek);
    }
}
