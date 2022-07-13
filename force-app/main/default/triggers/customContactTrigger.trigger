trigger customContactTrigger on Contact_Details__c (before insert,after insert,after update) {
    List<id> accId = new List<id>();
    for(Contact_Details__c cd :trigger.new){
        accId.add(cd.Account_Details__c);
    }
    List<Account_Details__c> accListData=new List<Account_Details__c>([select Name,Mobile__c,Email__c,Country__c,Contact_Information__c from Account_Details__c where id in:accId]);
    List<Account_Details__c> accList=new List<Account_Details__c>();
    for(Contact_Details__c con:trigger.new){
        for(Account_Details__c ac:accListData){
            if(con.Name == ac.Name && con.Mobile__c == ac.Mobile__c && con.Email__c == ac.Email__c && con.Country__c == ac.Country__c){
                ac.Contact_Information__c='Duplicate value';
                accList.add(ac);
            }
        }
    }
    upsert accList;
    
    if(trigger.IsBefore && trigger.isInsert){
        List<Account_Details__c> acccList=new List<Account_Details__c>();
        for(Contact_Details__c con:trigger.new){
            for(Contact_Details__c con1:[select Name,Mobile__c,Email__c from Contact_Details__c] ){
                if(con.Name != con1.Name && con.Mobile__c !=con1.Mobile__c && con.Email__c !=con1.Email__c){
                    Account_Details__c accc= new Account_Details__c();
                    accc.Name=con.Name;
                    accc.Email__c=con.Email__c;
                    accc.Mobile__c=con.Mobile__c;
                    acccList.add(accc);
                    
                }
                else{
                    con.addError('Duplicate contact');
                }
            }
        }
        insert acccList;
    }
}
    
    
    /*
    map<string,Account_Details__c> mapIdAccount = new map<string,Account_Details__c>();
    for(Account_Details__c ad: [ select id,Name,	Mobile__c,Email__c,Country__c,Contact_Information__c 
                                from Account_Details__c where Id IN :accId]){
                                    mapIdAccount.put(ad.Id,ad);
                                }
    
    list<Contact_Details__c> cdList = new list<Contact_Details__c>();
    
    for(Contact_Details__c cd : trigger.new)
    {
        if(cd.Account_Details__c != null){
            if(mapIdAccount.containsKey(cd.Account_Details__c)){
                
                Account_Details__c ad = mapIdAccount.get(cd.Account_Details__c);
                
                if(cd.Name == ad.Name && cd.Mobile__c == ad.Mobile__c && cd.Email__c == ad.Email__c && cd.Country__c ==
                   ad.Country__c){     
                       ad.Contact_Information__c='trying to updating duplicate value';
                   }
                else if(cd.Name != ad.Name && cd.Mobile__c != ad.Mobile__c && cd.Email__c != ad.Email__c && cd.Country__c !=
                        ad.Country__c){
                            Account_Details__c adc=new Account_Details__c();
                            adc.Name=cd.Name;
                            adc.Mobile__c=cd.Mobile__c;
                            adc.Email__c=cd.Mobile__c;
                            adc.Country__c=cd.Country__c;
                        } 
            }
        }
    }
}
*/
/* List<Account_Details__c> adList=new List<Account_Details__c>([
select id,Name,	Mobile__c,Email__c,Country__c,Contact_Information__c,
(select id,Name,Mobile__c,Email__c,Country__c from Contact_Details__r) from Account_Details__c where id in:accId
]);
for(Account_Details__c ad :adList){
if(ad.Name==ad.Contact_Details__r.Name)
}

}
*/