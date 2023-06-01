# Task: Concurrent Logger

Create a logging adapter.
It should log at the debug level and above to STDOUT.

Logger should include thread ID, a formatted string that includes the program name, and the current function that is being called, and the current date-time in MM-DD-YY HH:MM:SS:MS format.
Spin up multiple threads. Each on should perform some work, like puts "I maked a widget!", sleep(1), 50 times.

Stretch goal:
Add a second function that calls the first one. Log should include the function name, e.g. where in the stack we are.

# What are features of a Log Adapter

Processing and formatting log messages: A logging adapter processes and formats log messages before passing them to the handlers. This can involve adding contextual information, dynamic values, or customizing the log message format docs.python.org, towardsdatascience.com.

Integration with different logging frameworks: Logging adapters provide a bridge between the logging system and different logging frameworks, such as Microsoft.Extensions.Logging github.com, Common.Logging github.com, and others.

Support for custom filters: Filters are used to add extra logic to determine which log messages to output. Logging adapters can support custom filters for more advanced filtering towardsdatascience.com.

Handling multiple processes and threads: Logging adapters can handle log messages from multiple processes and threads, ensuring that log messages are properly processed and handled docs.python.org.

Integration with external systems: Logging adapters can be used to integrate log messages with external systems, such as Azure Service Bus help.hcltechsw.com and other messaging systems.

Log level configuration: Logging adapters can be configured to specify the level of logging to use for the log (trace) file produced by the adapter docs.python.org, help.hcltechsw.com, help.hcltechsw.com.

Error handling and logging: Logging adapters can handle errors and log them to provide better visibility into the system's behavior stackoverflow.com.

Integration with third-party systems: Logging adapters can be integrated with third-party systems, such as TIBCO StreamBase Logback logging system docs.tibco.com.

Customization through configuration files: Logging adapters can be customized through configuration files, such as XML files, to modify their behavior and settings docs.oracle.com.
