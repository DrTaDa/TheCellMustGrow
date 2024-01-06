// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1920;
view_hport[0] = 1080;

view_camera[0] = camera_create_view(
	0, 0, view_wport[0], view_hport[0], 0, obj_camera_target, -1, -1, 2000, 2000
);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - (view_wport[0] / 2);
var _ypos = (_dheight / 2) - (view_hport[0] / 2);
window_set_rectangle(_xpos, _ypos, view_wport[0], view_hport[0]);

surface_resize(application_surface, view_wport[0], view_hport[0]);
