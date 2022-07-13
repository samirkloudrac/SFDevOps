trigger customAccountTrigger on Account_Details__c (before insert,after insert,before update) {
    if(trigger.isBefore && trigger.isUpdate){	
        List<Account_Details__c> adList = new List<Account_Details__c>([select Name,Email__c,Mobile__c,Country__c,
                                                                        Contact_Information__c from Account_Details__c]);
        
        for(Account_Details__c accNew:trigger.new){
            
            Account_Details__c accOld = trigger.oldMap.get(accNew.id);//Trigger.oldMap is only available in update and delete events and cannot be accessed in insert event triggers. 
            
            if(accOld.Name == accNew.Name && accOld.Email__c == accNew.Email__c && accOld.Mobile__c == accNew.Mobile__c){
                accNew.addError('You cannot Create Duplicate Account');
                
            }
        }
    }
}


/*
if(accOld.Name == accNew.Name && accOld.Email__c == accNew.Email__c && accOld.Mobile__c == accNew.Mobile__c &&
accOld.Country__c == accNew.Country__c ){
accOld.Contact_Information__c = 'Updating because got same data';
adList.add(accOld);
}
else if(accOld.Name == accNew.Name && accOld.Email__c == accNew.Email__c && accOld.Mobile__c == accNew.Mobile__c){
accNew.addError('You cannot Create Duplicate Account');
adList.add(accNew);
}

}

}
update adList;
}
}
*/