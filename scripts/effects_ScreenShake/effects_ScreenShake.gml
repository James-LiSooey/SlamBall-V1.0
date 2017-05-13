///Create oEffect_ScreenShake and shakes screen based on intensity and length of time
//argument0 = intensity of shake
//argument1 = intensity of shake
//argument2 = length of shake

shakeEff = instance_create(0,0, oEffect_ScreenShake)

shakeEff.alarm[0] = argument2
shakeEff.intensity_X = argument0
shakeEff.intensity_Y = argument1