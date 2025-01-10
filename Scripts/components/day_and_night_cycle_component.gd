class_name DayAndNightCycleComponent
extends CanvasModulate

@export var initial_day := 1 :
	set(int_day):
		initial_day = int_day
		DayAndNightCycleManager.initial_day = int_day
		DayAndNightCycleManager.set_initial_time()
		
@export var initial_hour := 12:
	set(int_hour):
		initial_hour = int_hour
		DayAndNightCycleManager.initial_hour = int_hour
		DayAndNightCycleManager.set_initial_time()
		
@export var initial_minute := 30:
	set(int_minute):
		initial_hour = int_minute
		DayAndNightCycleManager.initial_hour = int_minute
		DayAndNightCycleManager.set_initial_time()
		
@export var day_night_gradiant_texture: GradientTexture1D

func _ready() -> void:
	DayAndNightCycleManager.initial_minute = initial_minute
	DayAndNightCycleManager.initial_hour = initial_hour
	DayAndNightCycleManager.initial_day = initial_day
	DayAndNightCycleManager.set_initial_time()
	
	DayAndNightCycleManager.game_time.connect(on_game_time)


func on_game_time(time: float) -> void:
	var sample_value := 0.5 * (sin(time - PI * 0.5) + 1.0)
	color = day_night_gradiant_texture.gradient.sample(sample_value)
