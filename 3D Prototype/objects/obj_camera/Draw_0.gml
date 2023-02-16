/// DRAW EVENT

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

draw_clear(c_black);

camera.apply();

draw_sprite(spr_test, 0, 500, 240);


gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);