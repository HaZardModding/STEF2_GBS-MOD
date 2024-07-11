textures/gbs/map2flcarssec
{	

	qer_editorimage textures/map2/flcarssecurity.tga	
	nopicmip
	nomipmaps

	{
			map textures/map2/flcarssecurity.tga	
	}
	{
			map textures/map2/flcarssecurity.tga 
			blendfunc add
			rgbGen wave sin 0.4 0.3 0 1	
	}
	{
			map $lightmap
			blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/gbs/map2bluefog2
{
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nomarks
    	surfaceparm nolightmap
	{
		map models/weapons/attrexian_rifle/viewmodel/attrex-gas.tga
		blendFunc GL_ONE GL_ONE
		alphaGen vertex
		rgbGen vertex
	}
}

textures/gbs/map2bluefog
{
	qer_editorimage models/weapons/attrexian_rifle/viewmodel/attrex-gas.tga
	surfaceparm nosteps
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nomarks
    	surfaceparm nolightmap
	surfaceparm trans
	{
		map models/weapons/attrexian_rifle/viewmodel/attrex-gas.tga
		blendfunc add
		//rgbGen vertex
		tcMod scale .2 .2
		tcMod scroll 0.1 0.01
		detail
	}
	{
		map models/weapons/attrexian_rifle/viewmodel/attrex-gas.tga
		blendfunc add
		//rgbGen vertex
		tcMod scale .2 .2
		tcMod scroll -0.01 -0.1
		detail
	}

}


bluegas
{
	spritegen oriented
	sort additive
	{
		map models/weapons/attrexian_rifle/viewmodel/attrex-gas.tga
		blendFunc GL_ONE GL_ONE
		alphaGen vertex
		rgbGen vertex
	}
}
