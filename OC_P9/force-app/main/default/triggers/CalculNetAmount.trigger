/**
 * Trigger no used , replace by formula field
 * 
 * 
trigger CalculNetAmount on Order (before update) {

    List<Order> OrderList = new List<Order>();
    
    for (Order o : trigger.new){
        
        o.NetAmount__c = o.TotalAmount - o.ShipmentCost__c;
        OrderList.add(o);
    }

    update OrderList;
}
**/
