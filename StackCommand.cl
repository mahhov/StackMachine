class StackCommand{
	
	nextCommand : StackCommand;

	display(io : IO) : StackCommand {
		{
			self;
		}
	};
	
	(* returns the new head of teh stack *)
	evaluate(arg1 : StackCommand, arg2 : StackCommand) : StackCommand {
		{
			self;
		}
	};
	
	setNextCommand(c : StackCommand) : StackCommand {
		{
			nextCommand <- c;
			self;
		}
	};
	
	getNextCommand() : StackCommand {
		{
			nextCommand;
		}
	};

};