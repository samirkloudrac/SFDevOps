({
	doInit : function(component, event, helper) {
		component.set("v.var1","Demo value from Component")
        var data={
            'name':'test name',
            'Email':'test@gmail.com'
        };
        component.set("v.jsobject",data)
    	component.set("v.userData",
                      {
                          'myString1':'Samir',
                          'myInteger1':2222
                      }
                     )
    }
    
})