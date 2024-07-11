ac-skylayer2-cloudstar
{
qer_editorimage models/sky/textures/ac-bg.tga
surfaceparm nolightmap
surfaceparm trans
	{
		map models/sky/textures/stars-large.tga
		tcMod scale 20 20
	}
	{
		map models/sky/textures/ac-clouds2.tga
		blendFunc blend
		tcMod scroll .008 .003
		tcMod scale 4 4
	}
	{
		map models/sky/textures/ac-clouds.tga
		blendFunc blend
		tcMod scroll .0025 0
		tcMod scale 4 4
	}
}