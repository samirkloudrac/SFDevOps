public class ContactController1 {
	@auraEnabled
    public static List<contact> getContacts(id recordId){
        return [select Id,FirstName,LastName,email,phone from
               contact where Accountid=:recordId];
    }
}