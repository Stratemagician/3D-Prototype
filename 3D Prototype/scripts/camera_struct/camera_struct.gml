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
	
	update = function() {
		
	}

}