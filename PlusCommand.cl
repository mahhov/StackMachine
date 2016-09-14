class PlusCommand inherits StackCommand {
	
	display(io : IO) : PlusCommand {
		{
			io.out_string('+');
			nextCommand.display();
			self;
		}
	};
	
	evaluate(arg1 : IntCommand, arg2 : IntCommand) : StackCommand {
		{
			sum : Int <-arg1.getVlaue() + arg2.getVlaue();
			newCommand : IntCommand <- new IntCommand;
			newCommand.setValue(sum);
			newCommand.setNextCommand(arg2.getNextCommand());
			newCommand;
		}
	};

};