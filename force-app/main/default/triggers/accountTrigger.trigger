trigger accountTrigger on Account (before insert,after insert,before delete) {
  /*  if(trigger.isBefore && trigger.isDelete){
        List<Account> accList=[select id ,(select id from opportunities where AccountId != null) from Account];
       // [select id from Account where id in (select Accountid from opportunity) AND Id in:trigger.old]
        for(Account a:accList){
            trigger.oldMap.get(a.id).addError('you cannot delete account having opportunity');
        }
    }*/

}