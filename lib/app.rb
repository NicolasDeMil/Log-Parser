require_relative 'logs'
require_relative 'controller'
require_relative 'router'

LOG_FILE = File.open('lib/webserver.log')

logs = Logs.new(LOG_FILE)
controller = Controller.new(logs)
router = Router.new(controller)

# Start the program
router.run
