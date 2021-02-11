global class BatchAccountCA implements  Database.Batchable<sObject>, Database.Stateful{
    
   global Database.QueryLocator start(Database.BatchableContext bc){ 

       String query = 'SELECT Id, Chiffre_d_affaire__c, OrderActiv__c FROM Account WHERE OrderActiv__c=\'true\'';
       return Database.getQueryLocator(query);
   }
    
   global void execute(Database.BatchableContext bc, List<Account> scope){   
       
       list<Order> listOrders =  [SELECT Id, TotalAmount, AccountId FROM Order];
       
		for(integer i=0; i < scope.size(); i++){
			Account myAccount = scope[i];
			myAccount.Chiffre_d_affaire__c = 0;
             
           for(integer j=0; j < listOrders.size(); j++){
               if(listOrders[j].AccountId == myAccount.Id){
                   myAccount.Chiffre_d_affaire__c = myAccount.Chiffre_d_affaire__c + listOrders[j].TotalAmount;
               }                   
           }
       } 
       update scope;
   }    
    
   global void finish(Database.BatchableContext bc){     
       
   } 
}
