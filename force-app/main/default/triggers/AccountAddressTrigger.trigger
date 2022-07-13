trigger AccountAddressTrigger on Account (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        List<Account> accList=new List<Account>();
    for(Account a :trigger.new){
        if(a.Match_Billing_Address__c==True && a.BillingPostalCode !=Null){
            a.ShippingPostalCode=a.BillingPostalCode;
            //accList.add(a);
        }
    }
	insert accList;
    }
    if(trigger.isBefore && trigger.isUpdate){
           List<Account> accList=new List<Account>();
    		for(Account a :trigger.old){
            	if(a.Match_Billing_Address__c==True && a.BillingPostalCode !=Null){
            	a.ShippingPostalCode=a.BillingPostalCode;
            	//accList.add(a);
        }
    }
	update accList;

    }
}