public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account>accountsList=[Select name,AnnualRevenue from Account];
        for(Account acc:accountsList){
            String acctRev=acc.Name +':'+acc.AnnualRevenue;
            System.debug(acctrev);
        }
        
    }
}