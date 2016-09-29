@8192
D=A
@maxscreen // final address is 8191, so at 8191 we must still draw, but not at 8192
M=D

(MAINLOOP)

	// Get keyboard value
	@KBD
	D=M

	// Branch to KEY or NOKEY depending on value 
	@NOKEY
	D;JEQ
	@KEY
	0;JMP

	// Set color to white and call draw
	(NOKEY)
		@color
		M=0
		@DRAW
		0;JMP

	// Set color to black and call draw
	(KEY)
		@color
		M=-1
		@DRAW
		0;JMP

	// Draw selected color on whole screen (512 x 256, or 8191 16-bit addresses) 
	(DRAW)

		// don't redraw if already the correct color
		@color
		D=M
		@SCREEN
		D=D-M
		@MAINLOOP
		D;JEQ

		// set i to 0
		@i
		M=0 // i = 0

		
		// Loop that iterates over screen and paints the color on each word
		(DRAWLOOP)
			@maxscreen
			D=M
			@i
			D=D-M
			@MAINLOOP
			D;JEQ // If at last address, finish drawing and restart loop
			@SCREEN
			D=A
			@i
			D=D+M
			@currentword
			M=D
			@color
			D=M
			@currentword
			A=M
			M=D // paint

			// increment i
			@i
			M=M+1
			@DRAWLOOP
			0;JMP