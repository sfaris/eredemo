public class MerchandiseOperations {

	// Create & return ID of a new Invoice Statement containing 1 line item
    public static Id invoice( String pName, Integer pSold, String pDesc) {

        // Retrieve the pName sample merchandise
        Merchandise__c m = [SELECT Price__c,Total_Inventory__c FROM Merchandise__c WHERE Name = :pName LIMIT 1];
    
        // break if no merchandise is found
        System.assertNotEquals(null, m);
    
        // Update the inventory of the merchandise item
        m.Total_Inventory__c -= pSold;
        update m;
            
        // Add a new invoice
        Invoice_Statement__c i = new Invoice_Statement__c(Description__c = pDesc);
        insert i;
    
        // Add a new line item to the invoice
        Line_Item__c li = new Line_Item__c(Name = '1',
            Invoice_Statement__c = i.Id,	// Uses the ID from the recently inserted invoice statement
            Merchandise__c = m.Id,			// Used the ID of the record retrieved from the Merchandise table
            Unit_Price__c = m.Price__c,
            Units_Sold__c = pSold);
        insert li;
    
        // Return the ID of the Invoice Statement created
        return i.Id;    
	}
}