class IntCommand inherits StackCommand {
	
	value : Int <- 0;

	display(io : IO) : IntCommand {
		{
			io.out_string('integer');
			nextCommand.display();
			self;
		}
	};
	
	evaluate(arg1 : StackCommand, arg2 : StackCommand) : StackCommand {
		{
			self;
		}
	};
	
	getValue() : Int {
		{
			value;
		}
	};
	
	setValue(v : Int) : Int {
		{
			value <- v;
			value;
		}
	};

};