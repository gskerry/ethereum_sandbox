

// From greeter instructions... make mortal functions... 

contract mortal {
    /* Define variable owner of the type address*/
    address owner;

    /* this function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) suicide(owner); }
}

contract MyToken is mortal {
    
	event Transfer(address indexed from, address indexed to, uint256 value);

    string public name;
    string public symbol;
    uint8 public decimals;

    /* creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    
    /* Startup function - same name as contract... runs ONLY ONCE when contract first uploaded */ 
    // function MyToken() {
    //     balanceOf[msg.sender] = 21000000;
    // }
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function myToken(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens                    
        name = tokenName;                                   // Set the name for display purposes     
        symbol = tokenSymbol;                               // Set the symbol for display purposes    
        decimals = decimalUnits;                            // Amount of decimals for display purposes        
    }
    
    /* Send coins */
    function transfer(address _to, uint256 _value) {
        /* Check if sender has balance and for overflows */
        if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to])
            throw;

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

	    /* Notifiy anyone listening that this transfer took place */
	    Transfer(msg.sender, _to, _value);

    }
   
}
