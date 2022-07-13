({
    abc:function(component,event,helper){
      console.log("i am init");
       var action = component.get("c.getLeads"); 
        action.setParams({
            recordId:component.get("v.recordId")
    
        });
        action.setCallback(this,function(data){
            var t=(data.getReturnValue());
         	component.set("v.Company1",t[0].Company)
            component.set("v.FirstName1",t[0].FirstName)
            component.set("v.LastName1",t[0].LastName)
            component.set("v.OpportunityName",t[0].Company)
  			
        });
  
        $A.enqueueAction(action);
    },
    handleClick:function(component,event,helper){
         var action=component.get("c.convert");
        action.setParams({
			 recordId:component.get("v.recordId")
            });
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
      
        $A.enqueueAction(action);
        
    },
    handleCancel:function(component,event,helper){
         var action=component.get("c.convert");
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
        $A.enqueueAction(action);
    }
});