public class PropertyUtility {
    public static void newListedProperties(){
        List<property__c> newPropList =[select name,Broker__r.email__c,Days_On_Market__c from property__c where Days_On_Market__c <=30];
        for(property__c pp:newPropList){
             String propEmail= pp.Name +':'+pp.Broker__r.email__c;
            System.debug('Concatanated name and broker email:'+propEmail);
        }
    }
}