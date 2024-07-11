#---------------------------------
# This places a set of translation
# sliders.
#---------------------------------

resource
Button
{
	title        "TX"
	name         "X_TRANSLATION_RESET_BUTTON"
	rect         374  0    21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewxtranslate 0.0"
}

resource
Label
{
	name         "X_TRANSLATION_VALUE_LABEL"
	rect         395  0    34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_xtrans"
}
	
resource
Slider
{
	name         "X_TRANSLATION_SLIDER"
	rect         429  0    87  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewxtranslate"
	linkcvar     "g_vt_xtrans"
	slidertype   float
	setrange     -300.0 300.0
	stepsize     1.0
}

resource
Button
{
	title        "TY"
	name         "Y_TRANSLATION_RESET_BUTTON"
	rect         374  25   21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewytranslate 0.0"
}

resource
Label
{
	name         "Y_TRANSLATION_VALUE_LABEL"
	rect         395  25    34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_ytrans"
}

resource
Slider
{
	name         "Y_TRANSLATION_SLIDER"
	rect         429  25   87  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewytranslate"
	linkcvar     "g_vt_ytrans"
	slidertype   float
	setrange     -300.0 300.0
	stepsize     1.0
}

resource
Button
{
	title        "TZ"
	name         "Z_TRANSLATION_RESET_BUTTON"
	rect         374  50   21   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewztranslate 0.0"
}

resource
Label
{
	name         "Z_TRANSLATION_VALUE_LABEL"
	rect         395  50     34   25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	linkcvar     "g_vt_ztrans"
}

resource
Slider
{
	name         "Z_TRANSLATION_SLIDER"
	rect         429  50   87  25
	fgcolor      0.93 0.83 0.00 1.00
	bgcolor      0.15 0.15 0.30 0.90
	borderstyle  "3D_BORDER"
	stuffcommand "viewztranslate"
	linkcvar     "g_vt_ztrans"
	slidertype   float
	setrange     -300.0 300.0
	stepsize     1.0
}

end.
