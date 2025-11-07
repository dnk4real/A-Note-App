## 四色渐变矩形
## 
## 这个组件允许你创建一个矩形，其四个角可以分别设置不同的颜色，从而实现四色渐变效果。
## 你可以通过调整每个角的颜色属性来定制渐变效果。
##

@tool
extends ColorRect
class_name QuadGradientRect

@export var top_left_color: Color = Color.YELLOW:
    set(c):
        top_left_color = c
        update()

@export var top_right_color: Color = Color.NAVY_BLUE:
    set(c):
        top_right_color = c
        update()

@export var bottom_left_color: Color = Color.DARK_RED:
    set(c):
        bottom_left_color = c
        update()

@export var bottom_right_color: Color = Color.ORCHID:
    set(c):
        bottom_right_color = c
        update()

func _ready() -> void:
    material = ShaderMaterial.new()
    material.shader = load("res://addons/quad_color_grad_rect/shaders/quad_corner_grad.gdshader")
    update()

func update():
    material.set_shader_parameter("topleft", top_left_color)
    material.set_shader_parameter("topright", top_right_color)
    material.set_shader_parameter("bottomleft", bottom_left_color)
    material.set_shader_parameter("bottomright", bottom_right_color)