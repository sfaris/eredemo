global class CleanUpRecords implements Database.Batchable<sObject> {

    global final String query;

	//Constructor
    global CleanUpRecords(String q) {
		query = q;
	}

    global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        // These are just the specific actions to be taken
		delete scope;
		Database.emptyRecycleBin(scope);
	}

    global void finish(Database.BatchableContext BC) {
		AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
							FROM AsyncApexJob WHERE Id = :BC.getJobId()];

	// Send an email to the Apex job's submitter notifying of job completion.
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	String[] toAddresses = new String[] {a.CreatedBy.Email};
	mail.setToAddresses(toAddresses);
	mail.setSubject('Record Clean Up Status: ' + a.Status);
	mail.setPlainTextBody ('The batch Apex job processed ' + a.TotalJobItems + ' batches with '+ a.NumberOfErrors + ' failures.');
	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}