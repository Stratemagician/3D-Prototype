/// INITIALISE GLOBAL VARIABLES
function global_init(){
	
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	vertex_format = vertex_format_end();
}

global_init();