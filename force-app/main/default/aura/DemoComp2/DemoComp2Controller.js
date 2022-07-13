({
	doInit : function(component, event, helper) {
		component.set("v.message","Button intitialized")
        component.set("v.Number","1111")
    },
            
    handleClick : function(component, event, helper) {
		component.set("v.message","Button Clicked ")
        
		
    },
    anotherhandleClick : function(component, event, helper) {
		component.set("v.Number","12455582")
    }
    
    
    
})