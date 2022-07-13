trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
   
    List<Task> taskList = new List<Task>();
    for(opportunity opp:trigger.new){
       // if(opp.StageName !=Trigger.oldMap.get(opp.id).StageName){
        if(trigger.isInsert){
            if(opp.StageName=='Closed Won'){
                Task t=new task();
            	t.Subject='Follow Up Test Task';
            	t.WhatId=opp.id;
            	taskList.add(t);
            }
        }
        if(trigger.isUpdate){
            if(opp.StageName=='Closed Won'){
                Task t=new task();
            	t.Subject='Follow Up Test Task';
            	t.WhatId=opp.id;
            	taskList.add(t);
            }
        }
        
        }
    
    if(taskList.size()>0){
        insert taskList;
    }

}