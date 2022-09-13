extends Node

enum {
	LOG_LEVEL_INFO, 
	LOG_LEVEL_WARNING, 
	LOG_LEVEL_ERROR, 
	LOG_LEVEL_CRITICAL
}

var log_file
var log_level = LOG_LEVEL_INFO


func _enter_tree():
	#Open log file
	log_file = File.new()
	log_file.open("user://log.txt", File.WRITE)
	
	
func _exit_tree():
	#Close log file
	log_file.close()
	
	
func _log(node, msg, level):
	#Filter log entry by level
	if level < log_level:
		return
		
	#Build log entry
	var system = "[" + node.get_name() + "]"
	var type
	
	if level == LOG_LEVEL_INFO:
		type = "[INFO]"
		
	elif level == LOG_LEVEL_WARNING:
		type = "[WARNING]"
		
	elif level == LOG_LEVEL_ERROR:
		type = "[ERROR]"
		
	elif level == LOG_LEVEL_CRITICAL:
		type = "[CRITICAL]"
		
	var entry = system + " " + type + " " + msg
	
	#Write log entry
	log_file.store_line(entry)
	print(entry)
	
	if level == LOG_LEVEL_CRITICAL:
		OS.alert(msg, "Critical Error")
	
	
func set_log_level(level):
	log_level = level
	
	
func log_info(node, msg):
	_log(node, msg, LOG_LEVEL_INFO)
	
	
func log_warning(node, msg):
	_log(node, msg, LOG_LEVEL_WARNING)
	
	
func log_error(node, msg):
	_log(node, msg, LOG_LEVEL_ERROR)
	
	
func log_critical(node, msg):
	_log(node, msg, LOG_LEVEL_CRITICAL)

