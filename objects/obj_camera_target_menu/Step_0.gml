
view_wport[0] = 1920;
view_hport[0] = 1080;

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

zoom_factor = 0.05;

var _lerpH = lerp(_viewH, new_zoomF * view_hport[0], zoom_factor);
var _newH = clamp(_lerpH, 0, room_height);
var _newW = _newH * (view_wport[0] / view_hport[0]);
camera_set_view_size(view_camera[0], _newW, _newH);
zoomF = new_zoomF;
