public class boundedChild {
	@auraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList=new List<Account>([
            select id ,Name from Account limit 5
        ]);
        return accList;
    }
}