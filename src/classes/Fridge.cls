public class Fridge implements KitchenUtility {

    // Private attributes
	
    private String modelNumber;
    private Integer numberInStock;
    
    // Constructors - overloaded
    
	public Fridge() {
		modelNumber = 'Unset';
		numberInStock = 0;
	}
	public Fridge(String theModelNumber, Integer theNumberInStock) {
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