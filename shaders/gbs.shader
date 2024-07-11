menu/main/logo-gbs
{
   nomipmaps
   maxpicmip 1
   cull none
   surfaceparm nolightmap
   {
      clampmap textures/gbs_general/gbs-ban.tga
      blendfunc Blend
      alphaGen global
      rgbGen global
   }
}

menu/load/gbs_ban
{
   nomipmaps
   maxpicmip 1
   cull none
   surfaceparm nolightmap
   {
      clampmap textures/gbs_general/gbs-ban.tga
      blendfunc Blend
      alphaGen global
      rgbGen global
   }
}


menu/load/gbs_button
{
   nomipmaps
   maxpicmip 1
   cull none
   surfaceparm nolightmap
   {
      clampmap textures/gbs_general/button13.tga
      blendfunc Blend
      alphaGen global
      rgbGen global
   }
}

menu/load/gbs_progress
{
   nomipmaps
   maxpicmip 1
   cull none
   surfaceparm nolightmap
   {
      animmap 2.0 textures/gbs_general/p0.tga textures/gbs_general/p1.tga textures/gbs_general/p2.tga textures/gbs_general/p3.tga textures/gbs_general/p4.tga textures/gbs_general/p5.tga 
      blendfunc Blend
      alphaGen global
      rgbGen global
   }
}



menu/load/gbs_flasher
{
   nomipmaps
   maxpicmip 1
   cull none
   surfaceparm nolightmap
   {
	clampmap textures/gbs_general/gbs-ban.tga
	blendFunc Blend
	alphaFunc GT0
        alphaGen wave sin 0.8 0.2 0 1
	rgbGen global
   }
}

textures/gbs_general/hallway_redalert
{
	qer_editorimage textures/enterprise/hallwaypanel_piece3r.tga
	{
		map textures/enterprise/hallwaypanel_piece3.tga
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
	{
		map textures/shaderfx/hallwaypanel_piece3rglow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.0 1 0 0.4
	//	rgbGen wave square 0.5 0.5 0 1.1
	}
}

