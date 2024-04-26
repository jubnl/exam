# Table of Contents

1. [Use case](#use-case)
2. [Usage](#usage)
3. [Threading in Python Code: Utilization and Purpose](#threading-in-python-code-utilization-and-purpose)
4. [Testing the debug window](#testing-the-debug-window)
5. [Debug Window source](debug_window_source.md)
6. [Log Sender source](log_sender_source.md)

# Use case

This script is specifically designed for collecting and managing logs in the game "Balatro" when modifications are
applied. It caters to developers and players who need to monitor and troubleshoot game behavior affected by mods. The
script offers comprehensive log management functionalities, including filtering logs by logger name or log level,
searching within the logs, and managing log data through saving or clearing operations.

# Usage

1. **Starting the Script**: Ensure the debug console script is running before opening the game.
2. **Filtering Logs**:
    - **By Logger Name**: Enter the logger name in the "Logger Name" field to filter logs by the specified logger.
    - **By Log Level**: Select the log level from the dropdown menu to filter logs by the specified log level.
3. **Searching Logs**:
    - **Focus Search Bar**: Press `Ctrl + F` to focus on the search bar.
    - **Navigate Search Results**: Press `Enter` to move to the next result or `Shift + Enter` to go to the previous
      search result.
    - **Focus on Logger Filter**: Press `Ctrl + L` to directly access the logger filter, streamlining the filtering
      process.
    - **Exit Search**: Hit `Esc` to move the focus back to the logs.
4. **Managing Logs**:
    - **Save Logs**: Use `Ctrl + S` to save all logs to a file. Press `Ctrl + Shift + S` to save only the filtered logs.
    - **Clear Logs**: Press `Ctrl + D` to clear all logs from the console.

# Threading in Python Code: Utilization and Purpose

The Python code showcases the use of threading primarily in the context of a networked application that manages
incoming log data from multiple client connections concurrently. Below is a breakdown of how threading is utilized, its
purpose, and the benefits it offers in this specific use case:

## Utilization of Threading:

Threading is employed in the function `listen_for_clients`, which listens for incoming connections from clients. Each
client connection is handled by spawning a new thread that executes the `client_handler` function. This function is
responsible for processing incoming log data from each connected client.

```py
threading.Thread(target=listen_for_clients, daemon=True, args=(root.get_console(),)).start()
```

Here, a thread is created and started to run the `listen_for_clients` function. This function continuously listens for
new client connections and, upon accepting a connection, creates another thread:

```py
threading.Thread(target=client_handler, args=(client, console)).start()
```

## Purpose of Threading:

- **Concurrent Processing**: Threading allows the application to handle multiple clients simultaneously. Each client
  connection is managed in its own thread, enabling concurrent data reception and processing. This is crucial for
  networked applications where handling multiple connections in a single thread can lead to significant delays and
  performance issues.
- **Non-blocking UI**: By delegating intensive tasks to separate threads, the main thread remains free to manage the
  user interface. This is important in tkinter-based applications like this one, where the UI thread should not be
  blocked by long-running operations (like waiting for network data), as it would make the UI unresponsive.
- **Efficiency and Responsiveness**: Threading improves the overall efficiency of the application by utilizing
  multi-core processors better. It also enhances responsiveness, as the application can continue to interact with the
  user while processing data in the background.

## Why It Is Used This Way:

- **Scalability**: Using threads for each client connection scales better as the number of clients increases compared to
  a single-threaded approach. It distributes the workload across multiple cores and processors, preventing any single
  thread from becoming a bottleneck.
- **Simplicity and Effectiveness**: Threading is a straightforward way to achieve parallelism in Python, especially for
  I/O-bound tasks like network communication. Python's threading library offers a simple interface to create and manage
  threads, making it accessible and effective for these types of applications.
- **Daemon Threads**: The threads are created as daemon threads, which means they will not prevent the application from
  exiting. Daemon threads are useful for background tasks that should not interfere with the main program's shutdown
  process.

## Testing the Debug Window

To test the debug window functionality, follow these steps in a terminal:

1. **Execute main.py**:
   - Run the command `python(3) main.py`. This script initializes the debugging process.

2. **Execute send_logs.py**:
   - After `main.py` is running, execute the command `python(3) send_logs.py`. This script sends logs to the debug window.

Note: Activating the virtual environment is not necessary for these scripts as they only utilize pure Python code.

