resource
Button
{
	title        "RX"
	name         "X_ROTATION_RESET_BUTTON"
	rect         516  0    21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewroll 0"
}

resource
Label
{
	name         "X_ROTATION_VALUE_LABEL"
	rect         537  0    34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_roll"
}


resource
Slider
{
	name         "X_ROTATION_SLIDER"
	rect         573  0    67  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewroll"
	linkcvar     "g_vt_roll"
	slidertype   float
	setrange     -179.9 180.0
	stepsize     45.0
}

resource
Button
{
	title        "RY"
	name         "Y_ROTATION_RESET_BUTTON"
	rect         516  25   21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewpitch 0"
}

resource
Label
{
	name         "Y_ROTATION_VALUE_LABEL"
	rect         537  25    34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_pitch"
}


resource
Slider
{
	name         "Y_ROTATION_SLIDER"
	rect         573  25   67  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewpitch"
	linkcvar     "g_vt_pitch"
	slidertype   float
	setrange     -179.9 180.0
	stepsize     45.0
}

resource
Button
{
	title        "RZ"
	name         "Z_ROTATION_RESET_BUTTON"
	rect         516  50   21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewyaw 0"
}

resource
Label
{
	name         "Z_ROTATION_VALUE_LABEL"
	rect         537  50    34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_yaw"
}


resource
Slider
{
	name         "Z_ROTATION_SLIDER"
	rect         573  50   67  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewyaw"
	linkcvar     "g_vt_yaw"
	slidertype   float
	setrange     -179.9 180.0
	stepsize     45.0
}

end.
