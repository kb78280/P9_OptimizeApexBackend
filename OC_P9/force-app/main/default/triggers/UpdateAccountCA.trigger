trigger UpdateAccountCA on Order ( after insert, after update) {

    List<Order> OrderList = new List<Order>();
  	Set<Id> OrdID = new Set<Id>();
    
    for (Order o : trigger.new){
       OrdID.add(o.AccountId);
       OrderList.add(o);
    }
    
    List<Account> AccID = ([SELECT id, Chiffre_d_affaire__c FROM Account WHERE id IN :OrdID]);
   
    for(Integer i=0; i < AccID.size(); i++){
			Account myAccount = AccID[i];
        	myAccount.Chiffre_d_affaire__c = 0;
           for(integer j=0; j < OrderList.size(); j++){
               if(OrderList[j].AccountId == myAccount.Id && OrderList[j].Status !='Ordered'){
                   myAccount.Chiffre_d_affaire__c = myAccount.Chiffre_d_affaire__c + OrderList[j].TotalAmount;
               }                   
           }
       }
    
    update AccID;
}
