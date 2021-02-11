@isTest
public class TestUpdateAccountCA {
    
     @isTest static void TestUpdateCawithOneOrder() {
        
        Account acc = TestDataFactory.createAccountsOrderItem(3);
         
        Test.startTest();
        update acc;
        Test.stopTest();
        
        System.assert(true);
         
        Account ac = [Select Id, Name, Chiffre_d_affaire__c FROM Account Where Id =:acc.Id];
        System.AssertEquals('Compte test', ac.Name);
        System.AssertEquals(300, ac.Chiffre_d_affaire__c);
     }
}
