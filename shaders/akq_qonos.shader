textures/akq_qonos/sky_qonos
{
    q3map_lightimage textures/holodeck_temple/lightcyan.tga
    qer_editorimage textures/common/sky.tga
    q3map_surfacelight 200
    q3map_lightsubdivide 256
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 1 175 65 45
    skyParms env/stars 512 -
    {
        map textures/holodeck_temple/clouds.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 4 4
        tcMod scroll 0.015 0.01
    }
    {
        map textures/holodeck_temple/clouds2.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        tcMod scale 3 3
        tcMod scroll 0.035 0.025
    }
}

textures/akq_qonos/light_wall
{
    qer_editorimage textures/akq_sfx/primaryhall_light.tga
    q3map_surfacelight 30000
    surfaceparm nolightmap
    {
        map textures/akq_sfx/primaryhall_light.tga
    }
}

textures/akq_qonos/light_wall2
{
    qer_editorimage textures/akq_sfx/primaryhall_light.tga
    q3map_surfacelight 100
    surfaceparm nolightmap
    {
        map textures/akq_sfx/primaryhall_light.tga
    }
}


textures/akq_qonos/window_01
{
    qer_editorimage textures/akq_sfx/window_01.tga
    q3map_surfacelight 1200
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/akq_sfx/window_01.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/akq_qonos/window_grawl
{
    qer_editorimage textures/akq_sfx/window_grawl.tga
    q3map_surfacelight 1200
    surfaceparm nolightmap
    {
        map textures/akq_sfx/window_grawl.tga
    }
}

textures/akq_qonos/klingon_forcefield
{
    qer_editorimage textures/akq_sfx/red_field.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    cull disable
    {
        map textures/akq_sfx/red_field.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 1292.7 1133.9
    }
}

textures/akq_qonos/fire_qonos1
{
    qer_editorimage textures/akq_sfx/flame1.tga
    surfaceparm nolightmap
    cull disable
    {
        animMap 10 textures/akq_sfx/flame1.tga textures/akq_sfx/flame2.tga textures/akq_sfx/flame3.tga textures/akq_sfx/flame4.tga textures/akq_sfx/flame5.tga textures/akq_sfx/flame6.tga textures/akq_sfx/flame7.tga textures/akq_sfx/flame8.tga 
        blendFunc GL_ONE GL_SRC_ALPHA
    }
}

textures/akq_qonos/fire_qonos2
{
    qer_editorimage textures/akq_sfx/flame1.tga
    q3map_surfacelight 500
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull disable
    {
        animMap 10 textures/akq_sfx/flame1.tga textures/akq_sfx/flame2.tga textures/akq_sfx/flame3.tga textures/akq_sfx/flame4.tga textures/akq_sfx/flame5.tga textures/akq_sfx/flame6.tga textures/akq_sfx/flame7.tga textures/akq_sfx/flame8.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 10
    }
    {
        animMap 10 textures/akq_sfx/flame2.tga textures/akq_sfx/flame3.tga textures/akq_sfx/flame4.tga textures/akq_sfx/flame5.tga textures/akq_sfx/flame6.tga textures/akq_sfx/flame7.tga textures/akq_sfx/flame8.tga textures/akq_sfx/flame1.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 10
    }
    {
        map textures/akq_sfx/flameball.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.6 0.2 0 0.6
    }
}

textures/akq_qonos/k_flag01
{
    qer_editorimage textures/akq_sfx/k_flag01.tga
    surfaceparm nomarks
    cull disable
    deformVertexes wave 194 sin 0 3 0 0.4
    tessSize 64
    {
        map textures/akq_sfx/k_flag01.tga
        rgbGen identity
    }
    {
        map textures/akq_sfx/k_flag01.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen identity
    }
    {
        //blendFunc GL_ONE GL_ONE
        map textures/akq_sfx/shadow.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
        tcGen environment
    }
}

textures/akq_qonos/beam_court
{
    qer_editorimage textures/borg/beam_edimage.tga
    qer_trans 0.5
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm nonsolid
    surfaceparm trans
    cull back
    {
        map textures/akq_sfx/beam.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        tcMod scroll -0.025 0
    }
    {
        map textures/borg/dust.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE_MINUS_SRC_COLOR
        tcMod scroll 0.05 0
    }
    {
        map textures/borg/dust.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE_MINUS_SRC_COLOR
        detail
        tcMod scroll -0.03 0
    }
}

