public class OrderTeamController {

  public List<AggregateResult> aggregateResultList{get;set;}
  
    public OrderTeamController() {
        aggregateResultList = new List<AggregateResult>();
        aggregateResultList = [select count(id) ordCount,sum(TotalAmount) ordSum,owner.Name ordName from Order group by owner.Name];
    }  
}
