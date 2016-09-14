(*  CS164 Spring 2004
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Main inherits IO {

	a2i : A2I <- new A2I;
	firstCommand : StackCommand <- new StackCommand;
	running : Int <- 1;
	
	main() : Object {
		{
			while running = 1
			loop {
				out_string(">");
				let inp : String <- in_string() in {
					if inp = "+" then
						pushStack(new PlusCommand)
					else
						if inp = "s" then
							pushStack(new SwapCommand)
						else
							if inp = "e" then
								firstCommand <- firstCommand.evaluate()
							else
								if inp = "d" then
									firstCommand.display(self)
								else
									if inp = "x" then
										running <- 0
									else
										let intCom : IntCommand <- new IntCommand in {
											intCom.setValue(a2i.a2i(inp));
											pushStack(intCom);
										}
									fi
								fi
							fi
						fi
					fi;
				};		
			} pool;
		}
	};
	
	pushStack(com : StackCommand) : StackCommand {
		{
			com.setNextCommand(firstCommand);
			firstCommand <- com;
			com;
		}
	};
	
	i2a(int : Int) : String {
		a2i.i2a(int)
	};

};


class StackCommand{
	
	nextCommand : StackCommand;

	display(io : Main) : StackCommand {
		{
			self;
		}
	};
	
	(* returns the new head of teh stack *)
	evaluate() : StackCommand {
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

class IntCommand inherits StackCommand {
	
	value : Int <- 0;

	display(io : Main) : StackCommand {
		{
			io.out_string(io.i2a(value).concat("\n"));
			nextCommand.display(io);
			self;
		}
	};
	
	evaluate() : StackCommand {
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

class PlusCommand inherits StackCommand {
	
	display(io : Main) : StackCommand {
		{
			io.out_string("+\n");
			nextCommand.display(io);
			self;
		}
	};
	
	evaluate() : StackCommand {
		{
			case nextCommand of
				int1 : IntCommand => {
					case nextCommand.getNextCommand() of
						int2 : IntCommand => {
							let sum : Int <- int1.getValue() + int2.getValue(),
												newCommand : IntCommand <- new IntCommand in {
								newCommand.setValue(sum);
								newCommand.setNextCommand(int2.getNextCommand());
								newCommand;
							};
						};
					esac;
				};
			esac;
		}
	};

};

class SwapCommand inherits StackCommand {
	
	display(io : Main) : StackCommand {
		{
			io.out_string("s\n");
			nextCommand.display(io);
			self;
		}
	};
	
	evaluate() : StackCommand {
		{
			let arg2 : StackCommand <- nextCommand.getNextCommand() in {
				nextCommand.setNextCommand(arg2.getNextCommand());
				arg2.setNextCommand(nextCommand);
				arg2;
			};
		}
	};

};