({
	doInit : function(component, event, helper) {
		component.set("v.message1","Hey!! Try me")
        component.set("v.message2","Hey !! Try me")
	},
    handleButton1 : function(component, event, helper) {
       // var btn=event.getSource();
        //var msg=btn.get("v.label");
		component.set("v.message1",event.getSource().get("v.label"));
	},
    handleButton2 : function(component, event, helper) {
		component.set("v.message2","button 2 Clicked")
	}
})