public class contactController {
    @auraEnabled
    public static List<Contact> getContacts(List<Id> accountIds){
        List<Contact> contactList=new List<Contact>([
            Select id ,name,AccountId,phone,email from contact where accountId in:accountIds 
            ]);
        return contactList;
    }

}