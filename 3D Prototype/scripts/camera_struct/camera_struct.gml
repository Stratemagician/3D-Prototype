/// CAMERA STRUCT
function camera_struct(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, fov, aspect, znear, zfar) constructor {

	self.xfrom	= xfrom;
	self.yfrom	= yfrom;
	self.zfrom	= zfrom;
	self.xto	= xto;
	self.yto	= yto;
	self.zto	= zto;
	self.xup	= xup;
	self.yup	= yup;
	self.zup	= zup;
	
	self.fov	= fov;
	self.aspect = aspect;
	self.znear	= znear;
	self.zfar	= zfar;
	
	self.pitch	= 0;
	self.dir	= 0;
	
	self.camera = camera_create();
	
	apply = function() {
		var view_mat = matrix_build_lookat(self.xto, self.yto, self.zto, self.xfrom, self.yfrom, self.zfrom, self.xup, self.yup, self.zup);
		var proj_mat = matrix_build_projection_perspective_fov(self.fov, -self.aspect, self.znear, self.zfar);	
		camera_set_view_mat(self.camera, view_mat);
		camera_set_proj_mat(self.camera, proj_mat);
		camera_apply(self.camera);
	}
	
	get_view_mat = function() {
		return camera_get_view_mat(self.camera);
	}
	
	get_proj_mat = function() {
		return camera_get_proj_mat(self.camera);
	}
	
	draw_skybox = function() {
			
	}
	
	update_free = function() {
		var dx = 0;
		var dy = 0;
		var dz = 0;
		
		var spd = 4;
		
		if (keyboard_check(ord("W")))
		{
			dx += dcos(dir) * dcos(pitch);
			dy -= dsin(pitch);
			dz -= dsin(dir) * dcos(pitch);
		}
		
		if (keyboard_check(ord("S")))
		{
			dx -= dcos(dir) * dcos(pitch);
			dy += dsin(pitch);
			dz += dsin(dir) * dcos(pitch);
		}
		
		if (keyboard_check(ord("A")))
		{
			dx += dsin(dir) * dcos(pitch);
			dz += dcos(dir) * dcos(pitch);
		}
		
		if (keyboard_check(ord("D")))
		{
			dx -= dsin(dir) * dcos(pitch);
			dz -= dcos(dir) * dcos(pitch);
		}
		
		if (mouse_check_button(mb_middle))
		{
			var mx = window_mouse_get_x() - window_get_width() / 2;
			var my = window_mouse_get_y() - window_get_height() / 2;
			dir += mx / 10;
			pitch = clamp(pitch + my / 10, -80, 80);
			window_mouse_set(window_get_width() / 2, window_get_height() / 2);
		}
		
		xfrom += dx * spd;
		yfrom += dy * spd;
		zfrom += dz * spd;
		
		xto = xfrom + dcos(dir) * dcos(pitch);
		yto = yfrom - dsin(pitch);
		zto = zfrom - dsin(dir) * dcos(pitch);
	}

}