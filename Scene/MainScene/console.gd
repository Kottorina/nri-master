extends MarginContainer

signal ConsoleSignal

@export var node_with_console_signal : Array[Node]

@export var console_cont : Container

func _ready() -> void:
	for node in node_with_console_signal:
		node.ConsoleSignal = ConsoleSignal
	
	ConsoleSignal.connect(ConsoleSignalEmit)
	

const TimerDeadTime : int = 10

func ConsoleSignalEmit( str_data : String ) -> void:
	var label = Label.new()
	console_cont.add_child(label)
	
	label.text = str_data
	
	var timer = Timer.new()
	label.add_child(timer)
	timer.timeout.connect(label.queue_free)
	timer.start(TimerDeadTime)
