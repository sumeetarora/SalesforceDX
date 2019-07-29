({
	getActivities : function(component) {
	var RelatedAccId = component.get("v.RelatedContactId")
        var action = component.get("c.findActivityByContact");
        action.setParams({
            "searchKey": RelatedAccId
            
        });//get data from controller
        action.setCallback(this, function(a) {
            component.set("v.AllActivity", a.getReturnValue());//set data in the page variable
            console.log(a.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})