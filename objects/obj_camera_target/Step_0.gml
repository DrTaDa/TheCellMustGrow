var _spd = 20;

var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _hspd = _right - _left;
var _vspd = _down - _up;

if (_hspd != 0 || _vspd != 0)
{
    var _dir = point_direction(0, 0, _hspd, _vspd);
    var _xadd = lengthdir_x(_spd, _dir);
    var _yadd = lengthdir_y(_spd, _dir);
    x = x + _xadd;
    y = y + _yadd;
}

view_wport[0] = 1920;
view_hport[0] = 1080;

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

if (x < _viewW / 2) x = _viewW / 2;
if (y < _viewH / 2) y = _viewH / 2;
if (x > room_width - (_viewW / 2)) x = room_width - (_viewW / 2);
if (y > room_height - (_viewH / 2)) y = room_height - (_viewH / 2);

zoom_factor = 0.05;

var _lerpH = lerp(_viewH, new_zoomF * view_hport[0], zoom_factor);
var _newH = clamp(_lerpH, 0, room_height);
var _newW = _newH * (view_wport[0] / view_hport[0]);
camera_set_view_size(view_camera[0], _newW, _newH);
zoomF = new_zoomF;

var _mouseW = mouse_wheel_down() - mouse_wheel_up();
new_zoomF = clamp(zoomF + (_mouseW * zoom_factor), 0.4, 2.0);
