module chip8.chip8;

import std.stdio;
import std.format;
import std.conv;
import derelict.sdl2.sdl;

/*
 * Class: Chip8
 *	TODO: Comment
 */
final class Chip8
{
	private bool[16] keyInputs; //16 possible key inputs (0-9, A-F)
	private bool[32][64] displayBuffer; //32 x 64 pixels
	private ubyte[4096] memory; //4096 bytes of memory
	private ubyte[16] registers; //16 general purpose 8-bit registers

	private ubyte soundTimer; //8-bit auto-decrementing counter (decrements @ 60hz)
	private ubyte delayTimer; //8-bit auto-decrementing counter (decrements @ 60hz)

	private ushort programCounter; //16-bit program counter - used to store currently executing address.
	private ushort indexRegister; //16-bit index register

	private Stack stack; //The stack is an array of 16 16-bit values

	public bool exit = false;

	//Constructor
	this()
	{
		stack = new Stack(16);
	}
	//Destructor
	~ this()
	{
	}

	/*
	 * function(x)
	 *	TODO: Comment
	 */
	bool Initialise()
	{
		return true;
	}

	/*
	 * function(x)
	 *	TODO: Comment
	 */
	bool LoadRom(string rom)
	{
		return true;
	}

	/*
	 * function(x)
	 *	TODO: Comment
	 */
	void DispatchEvents()
	{
	}

	/*
	 * function(x)
	 *	TODO: Comment
	 */
	void Cycle()
	{
	}

	/*
	* function(x)
	*	TODO: Comment
	*/
	void Draw()
	{
	}

}



/*
 * Class: Stack 
 *	TODO: Comment
 */
final class Stack
{
	private int maxSize;
	private ushort[] stackArray; //The stack is an array of 16 16-bit values. Could make this class a Template in order to create stacks of generic types.
	private int top;

	//Constructor
	this(int size)
	{
		this.maxSize = size;
		this.stackArray = new ushort[this.maxSize];
		this.top = -1;
	}
	//Destructor
	~ this()
	{
	}

	/*
	 * Push(short value)
	 *	Push a short to the top of the stack.
	 */
	public void Push(ushort value)
	{
		//If the stack isn't full, push a value to the top of the stack.
		if( !this.IsFull() )
		{
			this.stackArray[++this.top] = value;
		}
		else
		{
			throw new Exception( format( "Cannot push to full stack - value: %s", value ) );
		}
	}

	/*
	 * Pop()
	 *	Pop an element from the top of the stack.
	 */	
	public ushort Pop()
	{
		//If the stack isn't empty, pop an entry off the top.
		if( !this.IsEmpty() )
		{	
			return this.stackArray[this.top--];
		}
		else
		{
			throw new Exception( format( "Cannot pop from empty stack." ) );
		}
	}

	/*
	 * Peek()
	 *	Get the element from the top of the stack.
	 */	
	public ushort Peek()
	{
		return this.stackArray[this.top];
	}

	/*
	 * IsEmpty()
	 *	TODO: Comment
	 */	
	public bool IsEmpty()
	{
		return ( this.top == -1 );
	}

	/*
	 * IsFull()
	 *	TODO: Comment
	 */
	public bool IsFull()
	{
		return ( this.top == this.maxSize - 1 );
	}

	/*
	 * toString()
	 *	TODO: Comment
	 */
	public override string toString()
	{
		string output;
		foreach(ushort value; this.stackArray)
		{
			output = output ~ "[" ~ to!string(value) ~ "]";
		}
		return output;
	}

}
