class SwapCommand inherits StackCommand {
	
	display(io : IO) : SwapCommand {
		{
			io.out_string('s');
			nextCommand.display();
			self;
		}
	};
	
	evaluate(arg1 : StackCommand, arg2 : StackCommand) : StackCommand {
		{
			arg1.setNextCommand(arg2.getNextCommand());
			arg2.setNextCommand(arg1);
			arg2;
		}
	};

};