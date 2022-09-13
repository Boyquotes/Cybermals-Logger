extends Node


func _ready():
	#Test log system
	Logger.log_info(self, "This is some info.")
	Logger.log_warning(self, "This is a warning.")
	Logger.log_error(self, "This is an error.")
	Logger.log_critical(self, "This is a critical error!")
	
	Logger.set_log_level(Logger.LOG_LEVEL_CRITICAL)
	Logger.log_info(self, "Suppressed info.")
	Logger.log_warning(self, "Suppressed warning.")
	Logger.log_error(self, "Suppressed error.")
	Logger.log_critical(self, "Unsuppressed critical error!")
