public class AccountHandler {
     
    public static void  insertAccount(integer n){
        integer k=1;
        List<Account> addAccounts=new List<Account>();
        while(k<=n){
            Account a=new Account();
            a.name= 'Acme Inc '+k;
            a.AccountNumber='A000'+k;
            addAccounts.add(a);
			k=k+1;
        }
        
        insert addAccounts;
        System.debug(addAccounts);
       }

}