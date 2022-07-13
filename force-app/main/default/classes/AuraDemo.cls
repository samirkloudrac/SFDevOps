public class AuraDemo {
    @AuraEnabled
    public static List<Combobox__mdt> recfetch(){
        List<Combobox__mdt> mdt= new List<Combobox__mdt>([Select Id,Object_Label__c	,Object_API_Name__c from Combobox__mdt]);
        return mdt;
    }

}