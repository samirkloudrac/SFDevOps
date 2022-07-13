public class AuraTaskController {
    @auraEnabled
    public static List<Lead> getLeads(string recordId){
        List<Lead> ldList=new List<Lead>([
            select LastName,company,FirstName,Status from lead where id =:recordId
        ]);
        return ldList;
    }
    @auraEnabled
    public static void convert(List<lead> Cl,string recordId){
       
        List<Lead> ldList=new List<lead>([select Id,LastName,FirstName,company,Status from lead where id=:recordId]);
        System.debug(ldList);
       	 if(ldList[0].status !='Closed - Converted'){            
            for(Lead ld:ldList){
                Account acc=new Account();            
                acc.Name=ld.company;
                insert acc; 
                
                Contact con=new Contact();          
                con.LastName=ld.LastName;
                con.FirstName=ld.FirstName;
                con.AccountId=acc.id;
                insert con;
                
                opportunity opp=new opportunity();
                opp.Name=ld.Company +'-';
                opp.StageName='Prospecting';
                opp.CloseDate=System.today();
                opp.AccountId=acc.id;
                insert opp;
                ld.Status='Closed - Converted';
                update ld;
      
            }
            
        }
        
    }
   
}