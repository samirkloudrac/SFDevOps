public class Demonow {
    public void method(){
        List<Account> accList=new List<Account>();
         
        for(integer i=1;i<5;i++){
            Account acc =new Account();
            acc.Name='Demonow'+i;
            acc.Industry='Democomp'+i;
            acc.First_Name__c='Rimas'+i;
            acc.Last_Name__c='samir'+i;
            accList.add(acc);
        }
        insert accList;
    }
    public void method2(){
        List<Account> accList11=new List<Account>();
        List<Account> accList=[SELECT Id,name from account where Name like 'Demonow%'];
        for(Account acc:accList){
            acc.Phone='9494'+math.random();
            accList11.add(acc);
        }
        if(accList11.size()>0){
               update accList11;
        }
     

    }
}