public class Toaster implements KitchenUtility {

    // Private attributes
    
    private String modelNumber;
    private Integer numberInStock;
    
    // Constructors
	
    public Toaster() {
		modelNumber = 'Unset';
		numberInStock = 0;
	}
	public Toaster(String theModelNumber, Integer theNumberInStock) {
		modelNumber = theModelNumber;
		numberInStock = theNumberInStock;
	}

	// Get methods
    
    public String getModelNumber() {
		return modelNumber;
	}
    public Integer getNumberInStock () {
        return numberInStock;
    }
    
    // Set methods
    
    public void setModelNumber (String theModelNumber) {
        modelNumber = theModelNumber;
    }
    public void updateStock(Integer justSold) {
		numberInStock = numberInStock - justSold;
	}
}