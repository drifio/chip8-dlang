import std.stdio;
import chip8.chip8;

void main()
{
	auto chip8 = new Chip8();
	chip8.Initialise();
	chip8.LoadRom("pong.bin");
	while( !chip8.exit )
	{
		chip8.DispatchEvents();
		chip8.Cycle();
		chip8.Draw();
	}
}
